# frozen_string_literal: true

require_relative '../../../step/dividend'
require_relative '../../../operating_info'
require_relative '../../../action/dividend'

module Engine
  module Game
    module G1862
      module Step
        class Dividend < Engine::Step::Dividend
          HUDSON_TYPES = %i[hudson payout withhold].freeze

          def dividend_types
            HUDSON_TYPES
          end

          def actual_dividend_types(entity, revenue, subsidy)
            hudson_allowed?(entity, revenue, subsidy) ? HUDSON_TYPES : DIVIDEND_TYPES
          end

          def hudson_delta(entity, revenue)
            entity.share_price.price - revenue
          end

          def hudson_allowed?(entity, revenue, subsidy)
            revenue > 10 &&
              revenue < entity.share_price.price &&
              (entity.cash + subsidy) >= hudson_delta(entity, revenue)
          end

          def dividend_name(type)
            if type == :hudson
              'G Hudson Manoeuvre'
            else
              type
            end
          end

          def dividend_options(entity)
            revenue = @game.routes_revenue(routes)
            subsidy = @game.routes_subsidy(routes)
            actual_dividend_types(entity, revenue, subsidy).map do |type|
              payout = send(type, entity, revenue, subsidy)
              payout[:divs_to_corporation] = 0
              net_revenue = revenue
              net_revenue += hudson_delta(entity, revenue) if type == :hudson
              [type, payout.merge(share_price_change(entity, payout[:per_share].positive? ? net_revenue : 0))]
            end.to_h
          end

          def process_dividend(action)
            entity = action.entity
            revenue = @game.routes_revenue(routes)
            subsidy = @game.routes_subsidy(routes)
            kind = action.kind.to_sym
            payout = dividend_options(entity)[kind]

            handle_warranties!(entity)

            entity.operating_history[[@game.turn, @round.round_num]] = OperatingInfo.new(
              routes,
              action,
              revenue,
              @round.laid_hexes
            )

            entity.trains.each { |train| train.operated = true }

            @round.routes = []

            log_run_payout(entity, kind, revenue, subsidy, action, payout)
            if kind == :hudson && payout[:corporation].negative?
              entity.spend(-payout[:corporation], @game.bank)
            elsif payout[:corporation].positive?
              @game.bank.spend(payout[:corporation], entity)
            end
            payout_shares(entity, revenue) if payout[:per_share].positive?
            change_share_price(entity, payout)

            pass!
          end

          def holder_for_corporation(entity)
            entity
          end

          def log_run_payout(entity, kind, revenue, subsidy, action, payout)
            unless HUDSON_TYPES.include?(kind)
              @log << "#{entity.name} runs for #{@game.format_currency(revenue)} and pays #{action.kind}"
            end

            if payout[:per_share].zero? && payout[:corporation].zero?
              @log << "#{entity.name} does not run"
            elsif payout[:per_share].zero?
              @log << "#{entity.name} withholds #{@game.format_currency(revenue)}"
            end
            if kind == :hudson && payout[:corporation].negative?
              @log << "#{entity.name} spends #{@game.format_currency(-payout[:corporation])} "\
                'for George Hudson Manoeuvre'
            elsif kind == :hudson
              @log << "#{entity.name} earns reduced subsidy of #{@game.format_currency(payout[:corporation])} "\
                'for George Hudson Manoeuvre'
            elsif subsidy.positive?
              @log << "#{entity.name} earns subsidy of #{@game.format_currency(subsidy)}"
            end
          end

          def share_price_change(entity, revenue)
            if revenue.positive?
              curr_price = entity.share_price.price
              if revenue >= curr_price && revenue < 2 * curr_price
                { share_direction: :right, share_times: 2 }
              elsif revenue >= 2 * curr_price && revenue < 3 * curr_price
                { share_direction: :right, share_times: 4 }
              elsif revenue >= 3 * curr_price && revenue < 4 * curr_price
                { share_direction: :right, share_times: 6 }
              elsif revenue >= 4 * curr_price
                { share_direction: :right, share_times: 8 }
              else
                {}
              end
            else
              { share_direction: :left, share_times: 2 }
            end
          end

          def withhold(_entity, revenue, subsidy)
            { corporation: revenue + subsidy, per_share: 0 }
          end

          def payout(entity, revenue, subsidy)
            { corporation: subsidy, per_share: payout_per_share(entity, revenue) }
          end

          def hudson(entity, revenue, subsidy)
            diff = hudson_delta(entity, revenue)
            { corporation: subsidy - diff, per_share: payout_per_share(entity, revenue + diff) }
          end

          def movement_str(times, dir)
            "#{times / 2} #{dir}"
          end

          def handle_warranties!(entity)
            # remove one warranty from each train and see if it rusts
            entity.trains.each do |train|
              train.name = train.name[0..-2] if train.name.include?('*')
              next unless @game.deferred_rust.include?(train) && !train.name.include?('*')

              @log << "#{train.name} rusts after warranty expired"
              @game.deferred_rust.delete(train)
              @game.rust(train)
            end
          end
        end
      end
    end
  end
end
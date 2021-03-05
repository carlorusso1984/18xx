# frozen_string_literal: true

require_relative 'base'
require_relative 'program_enable'

module Engine
  module Action
    class ProgramSharePass < ProgramEnable
      def initialize(entity)
        super(entity)
      end

      def self.description
        'Pass in the Share Round'
      end

      def self.print_name
        'Pass in Share Round'
      end

      def disable?(game)
        !game.round.stock?
      end
    end
  end
end

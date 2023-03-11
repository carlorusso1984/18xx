# frozen_string_literal: true

module Engine
  module Game
    module G1867
      module Entities
        COMPANIES = [
          {
            name: 'rules until start of phase 3',
            sym: '3',
            value: 3,
            revenue: 0,
            desc: 'Hidden corporation',
            abilities: [{ type: 'blocks_hexes', hexes: ['M13'] }],
            color: nil,
          },
          {
            name: 'Champlain & St. Lawrence',
            sym: 'C&SL',
            value: 30,
            revenue: 10,
            discount: 10,
            desc: 'No special abilities.',
            color: nil,
          },
          {
            name: 'Niagara Falls Bridge',
            sym: 'NFB',
            value: 45,
            revenue: 15,
            discount: 15,
            desc: 'When owned by a corporation, they gain $10 extra revenue for '\
                  'each of their routes that include Buffalo',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                hexes: ['F18'],
                amount: 10,
              },
            ],
            color: nil,
          },
          {
            name: 'Montreal Bridge',
            sym: 'MB',
            value: 60,
            revenue: 20,
            discount: 20,
            desc: 'When owned by a corporation, they gain $10 extra revenue for '\
                  'each of their routes that include Montreal',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                hexes: ['L12'],
                amount: 10,
              },
            ],
            color: nil,
          },
          {
            name: 'Quebec Bridge',
            sym: 'QB',
            value: 75,
            revenue: 25,
            discount: 25,
            desc: 'When owned by a corporation, they gain $10 extra revenue for '\
                  'each of their routes that include Quebec',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                hexes: ['O7'],
                amount: 10,
              },
            ],
            color: nil,
          },
          {
            name: 'St. Clair Tunnel',
            sym: 'SCT',
            value: 90,
            revenue: 30,
            discount: 30,
            desc: 'When owned by a corporation, they gain $10 extra revenue for '\
                  'each of their routes that include Detroit',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                hexes: %w[A19 A17],
                amount: 10,
              },
            ],
            color: nil,
          },
        ].freeze

        CORPORATIONS = [
          {
            sym: 'CNR',
            name: 'Canadian Northern Railway',
            logo: '1867/CNR',
            simple_logo: '1867/CNR.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'CPR',
            name: 'Canadian Pacific Railway',
            logo: '1867/CPR',
            simple_logo: '1867/CPR.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: '#ef4223',
            reservation_color: nil,
          },
          {
            sym: 'C&O',
            name: 'Chesapeake and Ohio Railway',
            logo: '1867/CO',
            simple_logo: '1867/CO.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: '#0189d1',
            reservation_color: nil,
          },
          {
            sym: 'GTR',
            name: 'Grand Trunk Railway',
            logo: '1867/GTR',
            simple_logo: '1867/GTR.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: '#d75500',
            reservation_color: nil,
          },
          {
            sym: 'GWR',
            name: 'Great Western Railway',
            logo: '1867/GWR',
            simple_logo: '1867/GWR.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: :darkBlue,
            reservation_color: nil,
          },
          {
            sym: 'ICR',
            name: 'Intercolonial Railway',
            logo: '1867/ICR',
            simple_logo: '1867/ICR.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: '#7b352a',
            reservation_color: nil,
          },
          {
            sym: 'NTR',
            name: 'National Transcontinental Railway',
            logo: '1867/NTR',
            simple_logo: '1867/NTR.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'NYC',
            name: 'New York Central Railroad',
            logo: '1867/NYC',
            simple_logo: '1867/NYC.alt',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 40],
            type: 'major',
            color: '#772282',
            reservation_color: nil,
          },
          {
            sym: 'BBG',
            name: 'Buffalo, Brantford, and Goderich',
            logo: '1867/BBG',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: nil,
          },
          {
            sym: 'BO',
            name: 'Brockville and Ottawa',
            logo: '1867/BO',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#009595',
            reservation_color: nil,
          },
          {
            sym: 'CS',
            name: 'Canada Southern',
            logo: '1867/CS',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#4cb5d2',
            reservation_color: nil,
          },
          {
            sym: 'CV',
            name: 'Credit Valley Railway',
            logo: '1867/CV',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#0097df',
            reservation_color: nil,
          },
          {
            sym: 'KP',
            name: 'Kingston and Pembroke',
            logo: '1867/KP',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#0097df',
            reservation_color: nil,
          },
          {
            sym: 'LPS',
            name: 'London and Port Stanley',
            logo: '1867/LPS',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#7c7b8c',
            reservation_color: nil,
          },
          {
            sym: 'OP',
            name: 'Ottawa and Prescott',
            logo: '1867/OP',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#d30869',
            reservation_color: nil,
          },
          {
            sym: 'SLA',
            name: 'St. Lawrence and Atlantic',
            logo: '1867/SLA',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#7c7b8c',
            reservation_color: nil,
          },
          {
            sym: 'TGB',
            name: 'Toronto, Grey, and Bruce',
            logo: '1867/TGB',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: :darkBlue,
            reservation_color: nil,
          },
          {
            sym: 'TN',
            name: 'Toronto and Nipissing',
            logo: '1867/TN',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#7b352a',
            reservation_color: nil,
          },
          {
            sym: 'AE',
            name: 'Algoma Eastern Railway',
            logo: '1867/AE',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#d75500',
            reservation_color: nil,
          },
          {
            sym: 'CA',
            name: 'Canada Atlantic Railway',
            logo: '1867/CA',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#772282',
            reservation_color: nil,
          },
          {
            sym: 'NO',
            name: 'New York and Ottawa',
            logo: '1867/NO',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#d75500',
            reservation_color: nil,
          },
          {
            sym: 'PM',
            name: 'Pere Marquette Railway',
            logo: '1867/PM',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#4cb5d2',
            reservation_color: nil,
          },
          {
            sym: 'QLS',
            name: 'Quebec and Lake St. John',
            logo: '1867/QLS',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#0189d1',
            reservation_color: nil,
          },
          {
            sym: 'THB',
            name: 'Toronto, Hamilton and Buffalo',
            logo: '1867/THB',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            shares: [100],
            max_ownership_percent: 100,
            type: 'minor',
            color: '#d75500',
            reservation_color: nil,
          },
          {
            sym: 'CN',
            name: 'Canadian National',
            logo: '1867/CN',
            tokens: [0, 0, 0, 0, 0, 0, 0, 0],
            shares: [100],
            hide_shares: true,
            type: 'national',
            color: '#ef4223',
            reservation_color: nil,
          },
        ].freeze
      end
    end
  end
end

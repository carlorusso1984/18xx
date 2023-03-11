# frozen_string_literal: true

module Engine
  module Game
    module G18BF
      module Entities
        COMPANIES = [
          {
            name: 'Swansea and Mumbles',
            sym: 'P1',
            type: 'railway',
            value: 30,
            revenue: 10,
            discount: 10,
            desc: 'P1. No special abilities.',
            color: 'yellow',
          },
          {
            name: 'Stockton and Darlington',
            sym: 'P2',
            type: 'railway',
            value: 45,
            revenue: 15,
            discount: 15,
            desc: 'P2. Gives an extra, free, track lay in Darlington (I17) when owned by a player.',
            color: 'yellow',
            abilities: [
              {
                type: 'tile_lay',
                free: true,
                owner_type: 'player',
                hexes: %w[I17],
                tiles: %w[3 4 58],
              },
            ],
          },
          {
            name: 'Monkland and Kirkintilloch',
            sym: 'P3',
            type: 'railway',
            value: 45,
            revenue: 15,
            discount: 15,
            desc: 'P3. Gives an extra, free, track lay in Falkirk (D8) when owned by a player.',
            color: 'yellow',
            abilities: [
              {
                type: 'tile_lay',
                free: true,
                owner_type: 'player',
                hexes: %w[D8],
                tiles: %w[3 4 58],
              },
            ],
          },
          {
            name: 'Canterbury and Whistable',
            sym: 'P4',
            type: 'railway',
            value: 45,
            revenue: 15,
            discount: 15,
            desc: 'P4. Gives an extra, free, track lay in Canterbury (V28) when owned by a player.',
            color: 'yellow',
            abilities: [
              {
                type: 'tile_lay',
                free: true,
                owner_type: 'player',
                hexes: %w[V28],
                tiles: %w[3 4 58],
              },
            ],
          },
          {
            name: 'Leicester and Swannington',
            sym: 'P5',
            type: 'railway',
            value: 60,
            revenue: 20,
            discount: 20,
            desc: 'P5. Gives an extra, free, track lay in Leicester (P18) when owned by a player.',
            color: 'yellow',
            abilities: [
              {
                type: 'tile_lay',
                free: true,
                owner_type: 'player',
                hexes: %w[P18],
                tiles: %w[3 4 58],
              },
            ],
          },
          {
            name: 'Newcastle and Carlisle',
            sym: 'P6',
            type: 'railway',
            value: 60,
            revenue: 20,
            discount: 20,
            desc: 'P6. Gives a £10 revenue bonus for Newcastle (G17) when owned by a public company or a system.',
            color: 'yellow',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[G17],
              },
            ],
          },
          {
            name: 'London and Greenwich',
            sym: 'P7',
            type: 'railway',
            value: 75,
            revenue: 25,
            discount: 25,
            desc: 'P7. Gives a £10 revenue bonus for London when owned by a public company or a system.',
            color: 'yellow',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[K27 K29 L26 L30 M27 M29],
              },
            ],
          },
          {
            name: 'London and Blackwall',
            sym: 'P8',
            type: 'railway',
            value: 75,
            revenue: 25,
            discount: 25,
            desc: 'P8. Gives a £10 revenue bonus for London when owned by a public company or a system.',
            color: 'yellow',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type:
                'corporation',
                amount: 10,
                hexes: %w[K27 K29 L26 L30 M27 M29],
              },
            ],
          },
          {
            name: 'West London',
            sym: 'P9',
            type: 'railway',
            value: 75,
            revenue: 25,
            discount: 25,
            desc: 'P9. Gives a £10 revenue bonus for London when owned by a public company or a system.',
            color: 'yellow',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[K27 K29 L26 L30 M27 M29],
              },
            ],
          },
          {
            name: 'Liverpool and Manchester',
            sym: 'P10',
            type: 'railway',
            value: 90,
            revenue: 30,
            discount: 30,
            desc: 'P10. Gives a £10 revenue bonus for Liverpool (M11) ' \
                  'when owned by a public company or a system.',
            color: 'yellow',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[M11],
              },
            ],
          },
          {
            name: 'Irish Sea Ferry',
            sym: 'F1',
            type: 'ferry',
            value: 50,
            revenue: 10,
            desc: 'F1. Gives a £10 revenue bonus for one of the Ireland off-board areas ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 15, on_phase: '3' },
              { type: 'revenue_change', revenue: 20, on_phase: '5' },
              { type: 'revenue_change', revenue: 25, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[H2 N4 S3],
              },
            ],
          },
          {
            name: 'Irish Sea Ferry',
            sym: 'F2',
            type: 'ferry',
            value: 50,
            revenue: 10,
            desc: 'F2. Gives a £10 revenue bonus for one of the Ireland off-board areas ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 15, on_phase: '3' },
              { type: 'revenue_change', revenue: 20, on_phase: '5' },
              { type: 'revenue_change', revenue: 25, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[H2 N4 S3],
              },
            ],
          },
          {
            name: 'Irish Sea Ferry',
            sym: 'F3',
            type: 'ferry',
            value: 50,
            revenue: 10,
            desc: 'F3. Gives a £10 revenue bonus for one of the Ireland off-board areas ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 15, on_phase: '3' },
              { type: 'revenue_change', revenue: 20, on_phase: '5' },
              { type: 'revenue_change', revenue: 25, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[H2 N4 S3],
              },
            ],
          },
          {
            name: 'Hull Ferry',
            sym: 'F4',
            type: 'ferry',
            value: 100,
            revenue: 20,
            desc: 'F4. Gives a £10 revenue bonus for the Hull off-board area (L22) ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 30, on_phase: '3' },
              { type: 'revenue_change', revenue: 40, on_phase: '5' },
              { type: 'revenue_change', revenue: 50, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[L22],
              },
            ],
          },
          {
            name: 'Harwich Ferry',
            sym: 'F5',
            type: 'ferry',
            value: 100,
            revenue: 20,
            desc: 'F5. Gives a £10 revenue bonus for the Harwich off-board area (S29) ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 30, on_phase: '3' },
              { type: 'revenue_change', revenue: 40, on_phase: '5' },
              { type: 'revenue_change', revenue: 50, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[S29],
              },
            ],
          },
          {
            name: 'Plymouth Ferry',
            sym: 'F6',
            type: 'ferry',
            value: 100,
            revenue: 20,
            desc: 'F6. Gives a £10 revenue bonus for the Plymouth off-board area (X8) ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 30, on_phase: '3' },
              { type: 'revenue_change', revenue: 40, on_phase: '5' },
              { type: 'revenue_change', revenue: 50, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[X8],
              },
            ],
          },
          {
            name: 'Dover Ferry',
            sym: 'F7',
            type: 'ferry',
            value: 150,
            revenue: 30,
            desc: 'F7. Gives a £10 revenue bonus for the Dover off-board area (V30) ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 45, on_phase: '3' },
              { type: 'revenue_change', revenue: 60, on_phase: '5' },
              { type: 'revenue_change', revenue: 75, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[V30],
              },
            ],
          },
          {
            name: 'Aberdeen Ferry',
            sym: 'F8',
            type: 'ferry',
            value: 150,
            revenue: 30,
            desc: 'F8. Gives a £10 revenue bonus for the Aberdeen off-board area (A13) ' \
                  'when owned by a public company or a system.',
            color: 'aqua',
            abilities: [
              { type: 'revenue_change', revenue: 45, on_phase: '3' },
              { type: 'revenue_change', revenue: 60, on_phase: '5' },
              { type: 'revenue_change', revenue: 75, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[A13],
              },
            ],
          },
          {
            name: 'Metropolitan Railway',
            sym: 'U1',
            type: 'underground',
            value: 100,
            revenue: 40,
            desc: 'U1. Gives a £10 revenue bonus for London when owned by a public company or a system.',
            color: '#9b0056',
            text_color: 'white',
            abilities: [
              { type: 'revenue_change', revenue: 50, on_phase: '7' },
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[K27 K29 L26 L30 M27 M29],
              },
            ],
          },
          {
            name: 'City and South London',
            sym: 'U2',
            type: 'underground',
            value: 150,
            revenue: 75,
            desc: 'U2. Gives a £10 revenue bonus for London when owned by a public company or a system.',
            color: 'black',
            text_color: 'white',
            abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                amount: 10,
                hexes: %w[K27 K29 L26 L30 M27 M29],
              },
            ],
          },
        ].freeze

        CORPORATIONS = [
          {
            sym: 'BE',
            name: 'Bristol and Exeter Railway',
            logo: '18_bf/BE',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'U13',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'BG',
            name: 'Birmingham and Gloucester Railway',
            logo: '18_bf/BG',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'Q15',
            city: 0,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'EC',
            name: 'Eastern Counties Railway',
            logo: '18_bf/EC',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'L30',
            city: 1,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'EG',
            name: 'Edinburgh and Glasgow Railway',
            logo: '18_bf/EG',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'D10',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'EK',
            name: 'East Kent Railway',
            logo: '18_bf/EK',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'M29',
            city: 1,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'EPD',
            name: 'Edinburgh, Perth and Dundee Railway',
            logo: '18_bf/EPD',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'C11',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'GA',
            name: 'Glasgow and Ayr Railway',
            logo: '18_bf/GA',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'D6',
            city: 0,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'GC',
            name: 'Glasgow and Carlisle Railway',
            logo: '18_bf/GC',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'D6',
            city: 1,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'GJ',
            name: 'Grand Junction Railway',
            logo: '18_bf/GJ',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'P14',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'LB',
            name: 'London and Brighton Railway',
            logo: '18_bf/LB',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'M27',
            city: 1,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'LH',
            name: 'London and Birmingham Railway',
            logo: '18_bf/LH',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'K27',
            city: 0,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'LR',
            name: 'London and Bristol Railway',
            logo: '18_bf/LR',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'L26',
            city: 1,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'LS',
            name: 'London and Southampton Railway',
            logo: '18_bf/LS',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'M27',
            city: 0,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'LY',
            name: 'London and York Railway',
            logo: '18_bf/LY',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'K29',
            city: 0,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'MC',
            name: 'Midland Counties Railway',
            logo: '18_bf/MC',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'O19',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'ML',
            name: 'Manchester and Leeds Railway',
            logo: '18_bf/ML',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'M15',
            city: 1,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'ND',
            name: 'Newcastle and Darlington Junction Railway',
            logo: '18_bf/ND',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'G17',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'NM',
            name: 'North Midland Railway',
            logo: '18_bf/NM',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'O17',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'NU',
            name: 'North Union Railway',
            logo: '18_bf/NU',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'L12',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'SAM',
            name: 'Sheffield, Ashton-under-Lyne and Manchester Railway',
            logo: '18_bf/SAM',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'M17',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'SE',
            name: 'South Eastern Railway',
            logo: '18_bf/SE',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'M29',
            city: 0,
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'TV',
            name: 'Taff Vale Railway',
            logo: '18_bf/TV',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'U11',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'VN',
            name: 'Vale of Neath Railway',
            logo: '18_bf/VN',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'U7',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'YNM',
            name: 'York and North Midland Railway',
            logo: '18_bf/YNM',
            float_percent: 100,
            always_market_price: true,
            tokens: [0],
            type: 'minor',
            coordinates: 'K19',
            shares: [100],
            max_ownership_percent: 100,
            color: '#7c7b8c',
            reservation_color: 'yellow',
          },
          {
            sym: 'CR',
            name: 'Caledonian Railway',
            logo: '18_bf/CR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'GER',
            name: 'Great Eastern Railway',
            logo: '18_bf/GER',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'GNR',
            name: 'Great Northern Railway',
            logo: '18_bf/GNR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'LBSC',
            name: 'London, Brighton and South Coast Railway',
            logo: '18_bf/LBSC',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'LNW',
            name: 'London and North Western Railway',
            logo: '18_bf/LNW',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'LSW',
            name: 'London and South Western Railway',
            logo: '18_bf/LSW',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'LYR',
            name: 'Lancashire and Yorkshire Railway',
            logo: '18_bf/LYR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'MR',
            name: 'Midland Railway',
            logo: '18_bf/MR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'NBR',
            name: 'North British Railway',
            logo: '18_bf/NBR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'NER',
            name: 'North Eastern Railway',
            logo: '18_bf/NER',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'SEC',
            name: 'South Eastern Railway',
            logo: '18_bf/SEC',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20],
            type: 'major',
            shares: [20, 10, 10, 10, 10, 10, 10, 10, 10],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'GCR',
            name: 'Great Central Railway',
            logo: '18_bf/GCR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20],
            type: 'system',
            shares: [20, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'GWR',
            name: 'Great Western Railway',
            logo: '18_bf/GWR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20],
            type: 'system',
            shares: [20, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'LMS',
            name: 'London, Midlands and Scottish Railway',
            logo: '18_bf/LMS',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20],
            type: 'system',
            shares: [20, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'LNE',
            name: 'London and North Eastern Railway',
            logo: '18_bf/LNE',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20],
            type: 'system',
            shares: [20, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            color: '#3c7b5c',
            reservation_color: nil,
          },
          {
            sym: 'SR',
            name: 'Southern Railway',
            logo: '18_bf/SR',
            float_percent: 20,
            always_market_price: true,
            tokens: [0, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20],
            type: 'system',
            shares: [20, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            color: '#3c7b5c',
            reservation_color: nil,
          },
        ].freeze

        MINORS_GROUP_A = %w[EG EPD GA GC ML ND NU YNM].freeze
        MINORS_GROUP_B = %w[BE BG GJ NM MC SAM TV VN EC EK LB LH LR LS LY SE].freeze

        def company_header(company)
          case company.type
          when :railway
            'PRIVATE RAILWAY COMPANY'
          when :ferry
            'FERRY COMPANY'
          when :underground
            'UNDERGROUND RAILWAY'
          end
        end

        def unstarted_corporation_summary
          unipoed = (@corporations + @future_corporations).reject(&:ipoed)
          minor = unipoed.select { |c| c.type == :minor }
          major = unipoed.select { |c| c.type == :major }
          system = unipoed.select { |c| c.type == :system }
          summary = "#{minor.size} #{minor.one? ? 'minor' : 'minors'}, " \
                    "#{major.size} #{major.one? ? 'major' : 'majors'}, " \
                    "#{system.size} #{system.one? ? 'system' : 'systems'}"
          [summary, unipoed]
        end

        def maximum_loans(entity)
          case entity.type
          when :minor
            2
          when :major
            5
          when :system
            10
          end
        end

        def setup_companies
          msg = 'The three private railway companies removed from play are: '
          rejected = @companies.select { |c| c.type == :railway }.sort_by { rand }.take(3)
          rejected.sort_by { |c| @companies.index(c) }.each do |company|
            msg += "#{company.sym} (#{company.name}), "
            @companies.delete(company)
          end
          @log << msg.sub(/, $/, '.')
        end

        def setup_minors
          group_a = MINORS_GROUP_A.sort_by { rand }.map do |sym|
            @corporations.find { |c| c.id == sym }
          end
          group_b = MINORS_GROUP_B.sort_by { rand }.map do |sym|
            @corporations.find { |c| c.id == sym }
          end

          minors_start = group_a.pop(4) + group_b.pop(8)
          minors_sr2 = group_a.pop(2) + group_b.pop(4)
          minors_phase3 = group_a + group_b

          minors_start.each { |minor| minor.reservation_color = :yellow }
          minors_sr2.each { |minor| minor.reservation_color = :palegreen }
          minors_phase3.each { |minor| minor.reservation_color = :green }

          @log << 'The minor companies available from the start of the game are: ' \
                  "#{minors_start.map(&:id).sort.join(', ')}."
          @log << 'The minor companies available from the second stock round are: ' \
                  "#{minors_sr2.map(&:id).sort.join(', ')}."
          @log << 'The minor companies available from phase 3 are: ' \
                  "#{minors_phase3.map(&:id).sort.join(', ')}."
        end
      end
    end
  end
end

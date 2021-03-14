require 'squib'

data = Squib.csv file: 'data/metal_man.csv'

locations = ['TopLeft', 'TopMiddle', 'TopRight', 'BottomLeft', 'BottomMiddle', 'BottomRight']

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/metal_man.yml'

  background color: '#390016'

  text str: data['Action'].map { |a| a.upcase }, layout: :Action
  text str: data['Damage'].map { |a| "Damage " + a.to_s }, layout: :Damage
  text str: data['Delay'].map { |a| "Delay " + a.to_s }, layout: :Delay

  locations.each { |loc|
    text str: data[loc], layout: loc
  }

  line layout: :CenterLine
  line layout: :BottomLine
  line layout: :LeftLine
  line layout: :RightLine

  save format: :png
  save_png prefix: 'metal_'
  save_sheet prefix: 'sheet_metal_', columns: 5, rows: 2
end

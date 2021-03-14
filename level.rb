require 'squib'

data = Squib.csv file: 'data/level.csv'

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/level.yml'

  background color: data['Color']

  line layout: :CenterLine
  line layout: :TopThirdLine
  line layout: :BottomThirdLine

  save format: :png
  save_png prefix: 'level_'
end

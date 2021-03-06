require 'squib'

data = Squib.csv file: 'data/player.csv'

locations = ['InTop', 'InMiddle', 'InBottom', 'OutTop', 'OutMiddle', 'OutBottom']

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/player.yml'

  background color: '#001C3B'

  text str: data['Action'].map { |a| a.upcase }, layout: :Action
  text str: data['Hint'], layout: :Hint

  locations.each { |loc|
    text str: data[loc], layout: loc
  }

  # png file: data['Icon'].map { |a| "icons/#{a}" } , layout: :Icon

  save format: :png
  save_png prefix: 'player_'
  save_sheet prefix: 'sheet_player_', columns: 5, rows: 5
end

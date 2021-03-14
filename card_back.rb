require 'squib'

data = Squib.csv file: 'data/card_back.csv'

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/card_back.yml'

  background color: data['Color']

  png file: data['Icon'].map { |a| "icons/#{a}" } , layout: :Icon
  text str: data['Title'].map { |a| a.upcase }, layout: :Title

  save format: :png
  save_png prefix: 'card_back_'
end

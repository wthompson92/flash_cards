require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

card_1 = Card.new("What is 5 + 5?", '10', :math)
card_2 = Card.new("What is Rachel's favorite animal?", "panda", :turing_staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :pop_culture)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
round.start

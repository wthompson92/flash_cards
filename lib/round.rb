require '../lib/turn'
require '../lib/card'
require '../lib/deck'

class Round
  attr_reader :deck,
              :turns,
              :current_card,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
      if guess == card.answer
        @number_correct += 1
      end
    new_turn
  end

  def count
    @turn.count
  end
  
end

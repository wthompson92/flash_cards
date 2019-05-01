require '../lib/card'

class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
   @guess == @card.answer

  end

  def feedback
    if @guess == @card.answer
        "Correct"
    elsif @guess != @card.answer
       "Incorrect!"
    end
  end
end


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
  
    new_turn

  end

  def number_correct
    @guess == @current_card.answer
        @number_correct += 1
      end


  def count
    @turn.length
  end

  def number_correct_by_category(category)
   @turns.count do |turn| turn.correct? && category == @current_card.category
    end
  end


  def percent_correct
  number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(category)
     num_in_cat = turns.count { |turn| turn.card.category == category}
     100 * number_correct_by_category(category).to_f / num_in_cat
   end

  end

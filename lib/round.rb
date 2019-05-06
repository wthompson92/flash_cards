class Round
  attr_reader :deck,
              :turns,
              :current_card,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_index = 0
    @current_card = @deck.cards[@card_index]
    @number_correct = 0
  end

  def take_turn(guess)
      new_turn = Turn.new(guess, @current_card)
      @turns << new_turn
      @card_index += 1
      @current_card = @deck.cards[@card_index]
      if new_turn.correct?
        @number_correct += 1
      end
      new_turn
  end


  def number_correct_by_category(category)
    @turns.count do |turn|
    turn.correct? && turn.card.category == category
    end
  end


  def percent_correct
    (number_correct.to_f / @turns.length * 100).round(2)
  end

  def percent_correct_by_category(category)
     num_in_cat = turns.count { |turn| turn.card.category == category}
     (100 * number_correct_by_category(category).to_f / num_in_cat).round(2)
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards.\n"
    puts "#{"-" * 45}"
        while @turns.length < @deck.count
          @deck.count.times do
            puts "This is card number #{@turns.length + 1} of #{@deck.count}\n\n"
            puts @current_card.question
            take_turn(gets.chomp)
            puts @turns.last.feedback
          end
        end
    puts "****** Game over! ******\n"
    puts "You got #{number_correct} out of #{deck.count} for a total score of % #{percent_correct}"
      turns.each do |turn|
        puts "#{turn.card.category.to_s.capitalize.gsub!("_", " ")}:  % #{percent_correct_by_category(turn.card.category)}"
      end
  end
end

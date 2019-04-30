class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = [cards]
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
   @cards.each do |sub|
     if category == sub
       category += 1
     end
   end
  end
end

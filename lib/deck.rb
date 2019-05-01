class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

    def cards_in_category(category)
      matching_cards_cat = []
        @cards.each do |card|
         if card.category == category
            matching_cards_cat << card
          end
        end
       matching_cards_cat
     end
   end

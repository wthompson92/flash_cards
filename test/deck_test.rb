require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'
require '../lib/deck'

class DeckTest < Minitest::Test
  attr_reader :card_1, :card_2, :card_3, :cards, :deck

def setup
  @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  @cards = [card_1, card_2, card_3]
  @deck = Deck.new(@cards)
end

  def test_it_exists
    actual = Deck
    expected = @deck

    assert_instance_of actual, expected
  end

  def test_it_display_cards
      expected = @deck.cards
      actual = @cards

    assert_equal @deck.cards, @cards
  end

  def test_it_counts
    expected = @deck.count
    actual = 3
    assert_equal expected, actual
  end

  def test_it_seperates_by_category
    expected = @deck.cards_in_category(:STEM)
    actual = [@card_2, @card_3]
assert_equal expected, actual
  end
end

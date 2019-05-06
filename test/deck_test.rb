require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    actual = Deck
    expected = @deck

    assert_instance_of actual, expected
  end

  def test_it_has_cards
      expected = @cards
      actual = @deck.cards

    assert_equal expected, actual
  end

  def test_it_counts_cards_in_deck
    expected = 3
    actual =  @deck.count

    assert_equal expected, actual
  end

  def test_it_seperates_by_category
      expected = [@card_2, @card_3]
      actual = @deck.cards_in_category(:STEM)
    assert_equal expected, actual

      expected = [@card_1]
      actual = @deck.cards_in_category(:Geography)
    assert_equal expected, actual

      expected = []
      actual =  @deck.cards_in_category("Pop Culture")
    assert_equal expected, actual
    end
  end

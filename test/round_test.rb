require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test


  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card]
    @deck  = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
      expected = Round
      actual = @round
    assert_instance_of expected, actual
  end

  def test_it_has_a_deck
      expected = @deck
      actual = @round.deck
    assert_equal expected, actual
  end

  def test_it_tracks_turns
      expected = []
      actual = @round.turns
    assert_equal expected, actual
  end


  def test_current_card
      expected = @card_1
      actual = @round.current_card
    assert_equal expected, actual
  end


  def test_count_turns
      expected = 0
      actual = @round.turns.count
    assert_equal expected, actual

      @round.take_turn("Juneau")
      @round.take_turn("Venus")
      expected = 2
      actual = @round.turns.count
    assert_equal expected, actual
  end

  def test_it_displays_turns
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expected = [@card_1, @card_2]
    actual = @round.turns
    assert_equal expected, actual
  end


  def test_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expected = 1
    actual = @round.number_correct
    assert_equal expected, actual
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expected = 1
    actual = @round.number_correct_by_category(:Geography)
  assert_equal expected, actual
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expected = 50
    actual = @round.percent_correct
    assert_equal expected, actual
  end

  def test_percent_correct_by_category
        @round.take_turn("Juneau")
        @round.take_turn("Mars")
        expected = 100
        actual = @round.percent_correct_by_category(:STEM)
      assert_equal expected, actual
  end

  def test_it_gives_feedback
    expected = "Incorrect!"
    actual = @round.turns.last.feedback
  assert_equal expected, actual
  end
end

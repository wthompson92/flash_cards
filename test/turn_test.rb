require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  def test_it_exists
    expected = Turn
    actual = @turn
    assert_instance_of Turn, @turn
  end

  def test_turn_has_a_card
      expected = @card
      actual = @turn.card
    assert_equal expected, actual

      expected = @card_2
      actual = @turn_2.card
    assert_equal expected, actual
  end

  def test_it_has_a_guess
      expected = "Juneau"
      actual = @turn.guess
    assert_equal expected, actual

      expected = "Saturn"
      actual = @turn_2.guess
    assert_equal expected, actual
  end

  def test_guess_can_correct
      actual = @turn.correct?
    assert actual
  end

  def test_guess_can_incorrect
      actual = @turn_2.correct?
    refute actual
  end

  def test_feedback
    expected = "Correct!"
    actual = @turn.feedback
  assert_equal expected, actual

    expected = "Incorrect!"
    actual = @turn_2.feedback
  assert_equal expected, actual
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require '../lib/turn'
require '../lib/card'

class TurnTest < Minitest::Test
  attr_reader :card,
              :turn

def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", card)
  end

  def test_it_exists
    expected = Turn
    actual = turn
    assert_instance_of Turn, turn
  end

  def test_card
    expected = turn.card
    actual = card

    assert_equal expected, actual
  end

  def test_guess
      expected = turn.guess
      actual = "Juneau"
    assert_equal expected, actual
  end

  def test_correct?
    expected = turn.correct?
    actual = true
    assert_true expected
  end

def test_feedback
  expected = turn.feedback
  actual = "Correct"
  assert_equal expected, actual
end
end

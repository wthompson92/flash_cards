require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'

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
    expected = card
    actual = turn.card

    assert_equal expected, actual
  end

  def test_guess
      expected = "Juneau"
      actual = turn.guess

    assert_equal expected, actual
  end

  def test_correct?
    actual = turn.correct?
    assert actual
  end

def test_feedback
  expected = "Correct"
  actual = turn.feedback
  assert_equal expected, actual
end
end

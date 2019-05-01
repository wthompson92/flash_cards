require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'
require '../lib/round'
require '../lib/deck'
require 'pry'

class RoundTest < Minitest::Test
  attr_reader :card_1,
              :card_2,
              :card_3,
              :round,
              :deck
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @deck  = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end


  def test_it_exists
    expected = Round
    actual = round
    assert_instance_of expected, actual
  end
end

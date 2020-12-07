require 'minitest/autorun'
require_relative 'plane'

class PlaneTest < Minitest::Test
  def test_seat_for
    plane = Plane.new
    assert_equal 357, plane.seat_for(BoardingPass.new('FBFBBFFRLR'))
  end
end

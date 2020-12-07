require 'minitest/autorun'
require_relative 'boarding_pass'

class BoaringPassTest < Minitest::Test
  def test_row_partitions
    pass = BoardingPass.new('FBFBBFFRLR')
    expected = %w[F B F B B F F]
    assert_equal expected, pass.row_partitions
  end

  def test_column_partitions
    pass = BoardingPass.new('FBFBBFFRLR')
    expected = %w[R L R]
    assert_equal expected, pass.column_partitions
  end
end


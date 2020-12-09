require 'minitest/autorun'
require_relative 'passenger_answers'

class PassengerAnswersTest < Minitest::Test
  def test_basic_answers_by_group
    parser = PassengerAnswers.new('fixtures/basic_input')

    assert_equal [%w[f z m w]], parser.answers_by_group
  end

  def test_multiple_groups
    parser = PassengerAnswers.new('fixtures/multiple_groups')

    assert_equal [%w[a b c], %w[x y z]], parser.answers_by_group
  end

  def test_multiple_on_multiple_lines
    parser = PassengerAnswers.new('fixtures/multiple_on_multiple_lines')

    assert_equal [%w[a b c], %w[x y z]], parser.answers_by_group
  end

  def test_uniq
    parser = PassengerAnswers.new('fixtures/multiple_uniques')

    assert_equal [%w[a b c], %w[x y z]], parser.answers_by_group
  end

  def test_unanimous_answers
    parser = PassengerAnswers.new('fixtures/multiple_uniques')

    assert_equal [%w[a], %w[x]], parser.unanimous_answers_by_group
  end
end

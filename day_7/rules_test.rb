require 'minitest/autorun'
require_relative 'rules'

class RulesTest < MiniTest::Test
  def test_to_h
    rules = Rules.new('fixtures/basic_rules')

    expected = {
      'light red' => [
        { 'count' => '1', 'type' => 'bright white' },
        { 'count' => '2', 'type' => 'muted yellow' }
      ],
      'dark orange' => [{ 'count' => '3', 'type' => 'bright white' }]
    }

    assert_equal expected, rules.to_h
  end

  def test_to_h_with_no_other_bags
    rules = Rules.new('fixtures/empty_bag_rules')

    assert rules.to_h['faded blue'].empty?
  end
end

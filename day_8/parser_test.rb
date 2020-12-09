require 'minitest/autorun'
require_relative 'parser'
require_relative 'instruction'

class ParserTest < MiniTest::Test
  def test_example
    parser = Parser.new('fixtures/example_input')

    expected = [
      [:nop, 0],
      [:acc, 1],
      [:jmp, 4]
    ].map { |(type, value)| Instruction.new(type, value) }

    assert_equal expected, parser.instructions
  end
end

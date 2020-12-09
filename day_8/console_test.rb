require 'minitest/autorun'
require_relative 'console'
require_relative 'instruction'

class ConsoleTest < Minitest::Test
  def test_example
    instructions = [
      [:nop, 0],
      [:acc, 1],
      [:jmp, 4],
      [:acc, 3],
      [:jmp, -3],
      [:acc, -99],
      [:acc, 1],
      [:jmp, -4],
      [:acc, 6]
    ].map { |(type, value)| Instruction.new(type, value) }

    console = Console.new
    success = console.execute(instructions)

    refute success
    assert_equal 5, console.accumulator
  end
end

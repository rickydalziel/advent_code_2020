require_relative 'instruction'

class Parser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def instructions
    instruction_strings = File.readlines(filename, chomp: true)
    instruction_strings.map do |string|
      instruction_from(string)
    end
  end

  private

  def instruction_from(string)
    format = /^(?<type>nop|acc|jmp) (?<value>(\+|-)\d+)$/
    captures = string.match(format)
    Instruction.new(captures[:type].to_sym, captures[:value].to_i)
  end
end

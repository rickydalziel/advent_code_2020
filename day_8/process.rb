require_relative 'parser'
require_relative 'console'

instructions = Parser.new('input').instructions
console = Console.new
console.execute(instructions)
puts console.accumulator

instructions.each_with_index do |instruction, index|
  next if instruction.type == :acc

  new_instructions = instructions.dup
  operation = instruction.type == :nop ? :jmp : :nop
  new_instructions[index] = Instruction.new(operation, instruction.value)

  puts console.accumulator if console.execute(new_instructions)
end


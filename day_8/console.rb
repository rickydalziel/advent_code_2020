class Console
  attr_reader :accumulator
  def execute(instructions)
    @accumulator = 0
    instruction_pointer = 0
    ran_instructions = []

    until ran_instructions.include?(instruction_pointer) || instructions[instruction_pointer].nil?
      ran_instructions.push(instruction_pointer)

      instruction = instructions[instruction_pointer]
      case instruction.type
      when :acc
        @accumulator += instruction.value
        instruction_pointer += 1
      when :jmp
        instruction_pointer += instruction.value
      when :nop
        instruction_pointer += 1
      end
    end

    !ran_instructions.include?(instruction_pointer)
  end
end

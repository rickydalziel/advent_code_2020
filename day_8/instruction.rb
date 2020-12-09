class Instruction < Struct.new(:type, :value)
  include Comparable

  def ==(other)
    type == other.type && value == other.value
  end
end

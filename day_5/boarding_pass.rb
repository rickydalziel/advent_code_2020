class BoardingPass
  attr_reader :row_partitions, :column_partitions

  def initialize(pass_string)
    format = /^(?<row_partitions>(F|B)+)(?<column_partitions>(L|R)+)$/
    parsed = pass_string.match(format)
    @row_partitions = parsed[:row_partitions].chars
    @column_partitions = parsed[:column_partitions].chars
  end
end

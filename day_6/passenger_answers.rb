class PassengerAnswers
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def answers_by_group
    group_strings.map { |s| s.gsub("\n", '').chars.uniq }
  end

  def unanimous_answers_by_group
    group_strings.map { |g| individual_answers(g).inject(&:&) }
  end

  private

  def group_strings
    File.read(filename).split(/\n{2,}/)
  end

  def individual_answers(group)
    group.split("\n").map(&:chars)
  end
end

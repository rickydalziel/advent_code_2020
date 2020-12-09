require 'pry'

class Rules
  attr_reader :rules

  EMPTY_BAG_STRING = 'no other bags'

  def initialize(filename)
    @rules = File.readlines(filename, chomp: true)
  end

  def to_h
    rules.each_with_object({}) do |rule, rules_hash|
      bag_type = bag_type_for(rule)
      rules_hash[bag_type] = bags_inside_for(rule)
    end
  end

  private

  def bag_type_for(rule)
    format = /^(?<bag_type>.+) bags contain/
    parsed = rule.match(format)
    parsed[:bag_type]
  end

  def bags_inside_for(rule)
    format = /^.+ bags contain (?<bags>.+)\./
    bags = rule.match(format)[:bags]
    return [] if bags == EMPTY_BAG_STRING

    bags.split(",").map { |bag| parse_bag(bag.strip) }
  end

  def parse_bag(bag_string)
    format = /^(?<count>\d+) (?<type>.+) bags?/
    bag_string.match(format).named_captures
  end
end

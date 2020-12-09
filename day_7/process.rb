require_relative 'rules'

rules = Rules.new('input').to_h

def bag_types_inside(bag_type, rules, total_bags)
  bags = rules[bag_type]
  bags.each do |b|
    total_bags.push(b['type'])
    bag_types_inside(b['type'], rules, total_bags)
  end
end

def bags_inside(bag_type, rules, total_bags)
  bags = rules[bag_type]
  bags.each do |b|
    b['count'].to_i.times do
      total_bags.push(b['type'])
      bags_inside(b['type'], rules, total_bags)
    end
  end
end

bags_with_gold = rules.keys.select do |key|
  total_bags = []
  bag_types_inside(key, rules, total_bags)

  total_bags.include?('shiny gold')
end
puts bags_with_gold.size

bags_inside_gold = []
bags_inside('shiny gold', rules, bags_inside_gold)
puts bags_inside_gold.count

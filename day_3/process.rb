require_relative 'slope'

layout = File.readlines('input', chomp: true).map(&:chars)

slope = Slope.new(layout)
puts slope.traverse(3, 1)


trees_hit = []
[[1, 1], [3,1], [5,1], [7,1], [1,2]].each do |(right, down)|
  trees_hit.push(slope.traverse(right, down))
end

puts trees_hit.inject(&:*)

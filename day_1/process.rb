require 'benchmark'

def read_values
  File.read('input').split("\n").map(&:to_i)
end

def two_values_product(values)
  values_size = values.count

  # looks minging but counts each unique permutation once
  first_values = values[0, values_size - 3]
  first_values.each_with_index do |v1, index1|
    second_values = values[index1, values_size - 2]
    second_values.each do |v2|
      set = [v1, v2]
      return set.inject(:*) if set.sum == 2020
    end
  end
end

def three_values_product(values)
  values_size = values.count

  # looks minging but counts each unique permutation once
  first_values = values[0, values_size - 3]
  first_values.each_with_index do |v1, index1|
    second_values = values[index1, values_size - 2]
    second_values.each_with_index do |v2, index2|
      third_values = second_values[index2, values_size - 1]
      third_values.each do |v3|
        set = [v1, v2, v3]
        return set.inject(:*) if set.sum == 2020
      end
    end
  end
end

n = 10

values = read_values
Benchmark.bm do |x|
  x.report('two values') { n.times { puts two_values_product(values) } }
  x.report('three values') { n.times { puts three_values_product(values) } }
end

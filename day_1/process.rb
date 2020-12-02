require 'benchmark'

def read_values
  File.read('input').split("\n").map(&:to_i)
end

def two_values_product
  values = read_values

  values_size = values.count

  # looks minging but counts each unique permutation once
  first_values = values[0, values_size - 3]
  first_values.each_with_index do |v1, index1|
    second_values = values[index1, values_size - 2]
    second_values.each_with_index do |v2, index2|
      set = [v1, v2]
      puts set.inject(:*) if set.sum == 2020
    end
  end
end

def three_values_product
  values = read_values
  values_size = values.count

  # looks minging but counts each unique permutation once
  first_values = values[0, values_size - 3]
  first_values.each_with_index do |v1, index1|
    second_values = values[index1, values_size - 2]
    second_values.each_with_index do |v2, index2|
      third_values = second_values[index2, values_size - 1]
      third_values.each_with_index do |v3, index3|
        set = [v1, v2, v3]
        puts set.inject(:*) if set.sum == 2020
      end
    end
  end
end

two_values_product
three_values_product

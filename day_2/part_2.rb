def build_indexes(string)
  string.split('-').map(&:to_i).map { |i| i - 1 }
end

def build_password_data(line)
  line_items = line.split(" ")
  [build_indexes(line_items[0]), line_items[1].delete_suffix(':'), line_items[2]]
end

def valid_password?(password)
  indexes, required_char, value = build_password_data(password)
  indexes.map { |i| value[i] == required_char }.inject(&:^)
end

lines = File.read('input').split("\n")
valid_passwords = 0

lines.each do |password|
  valid_passwords += 1 if valid_password?(password)
end

puts valid_passwords

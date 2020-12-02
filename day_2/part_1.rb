def build_range(string)
  start_range, end_range = string.split('-').map(&:to_i)
  (start_range..end_range)
end

def build_password_data(line)
  line_items = line.split(' ')
  [build_range(line_items[0]), line_items[1].delete_suffix(':'), line_items[2]]
end

def valid_password?(password)
  range, required_char, value = build_password_data(password)
  range.include?(value.count(required_char))
end

lines = File.read('input').split("\n")
valid_passwords = 0

lines.each do |password|
  valid_passwords += 1 if valid_password?(password)
end

puts valid_passwords

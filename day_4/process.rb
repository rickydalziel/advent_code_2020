require_relative 'passports_file'
require_relative 'passport'

passports = PassportsFile.new('input').passports

puts passports.select(&:valid_basic?).count
puts passports.select(&:valid_advanced?).count


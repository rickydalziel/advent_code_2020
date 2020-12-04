require_relative 'passports_file'
require_relative 'passport'

passports = PassportsFile.new('input').passports

puts passports.select(&:valid?).count


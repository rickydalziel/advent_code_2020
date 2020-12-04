class Passport
  include Comparable

  attr_reader :passport_fields

  REQUIRED_FIELDS = [
    :ecl,
    :pid,
    :eyr,
    :hcl,
    :byr,
    :iyr,
    :hgt
  ]

  def initialize(passport_fields)
    @passport_fields = passport_fields
  end

  def valid?
    (REQUIRED_FIELDS - passport_fields.keys).empty?
  end

  def == (other)
    passport_fields == other.passport_fields
  end
end

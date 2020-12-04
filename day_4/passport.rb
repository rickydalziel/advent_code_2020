require_relative 'field_types'

class Passport
  include Comparable

  attr_reader :passport_fields

  REQUIRED_FIELDS = {
    ecl: EyeColor,
    pid: PassportId,
    eyr: ExpirationYear,
    hcl: HairColor,
    byr: BirthYear,
    iyr: IssueYear,
    hgt: Height
  }

  def initialize(passport_fields)
    @passport_fields = passport_fields
  end

  def valid_basic?
    (REQUIRED_FIELDS.keys - passport_fields.keys).empty?
  end

  def valid_advanced?
    return false unless valid_basic?

    REQUIRED_FIELDS.map do |key, type|
      type.valid?(passport_fields[key])
    end.all?
  end

  def == (other)
    passport_fields == other.passport_fields
  end
end

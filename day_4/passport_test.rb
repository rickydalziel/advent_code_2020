require 'minitest/autorun'
require_relative 'passport'

class PassportTest < Minitest::Test
  def test_valid_basic
    passport = Passport.new(
      ecl: 'gry',
      pid: '860033327',
      eyr: '2020',
      hcl: '#fffffd',
      byr: '1937',
      iyr: '2017',
      cid: '147',
      hgt: '183cm'
    )

    assert passport.valid?
  end

  def test_invalid_basic
    passport = Passport.new(
      ecl: 'gry',
      pid: '860033327',
      eyr: '2020',
      hcl: '#fffffd',
      byr: '1937',
      iyr: '2017'
    )

    refute passport.valid?
  end

  def test_optional_valid
    passport = Passport.new(
      ecl: 'gry',
      pid: '860033327',
      eyr: '2020',
      hcl: '#fffffd',
      byr: '1937',
      iyr: '2017',
      hgt: '183cm'
    )

    assert passport.valid?
  end
end

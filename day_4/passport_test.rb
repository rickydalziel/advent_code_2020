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

    assert passport.valid_basic?
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

    refute passport.valid_basic?
  end

  def test_optional_valid_basic
    passport = Passport.new(
      ecl: 'gry',
      pid: '860033327',
      eyr: '2020',
      hcl: '#fffffd',
      byr: '1937',
      iyr: '2017',
      hgt: '183cm'
    )

    assert passport.valid_basic?
  end

  def test_valid_advanced
    passport = Passport.new(
      pid: '087499704',
      hgt: '74in',
      ecl: 'grn',
      iyr: '2012',
      eyr: '2030',
      byr: '1980',
      hcl: '#623a2f'
    )

    assert passport.valid_advanced?
  end

  def test_invalid_advanced
    #added some numbers to the passport id which is invalid
    passport = Passport.new(
      pid: '1111087499704',
      hgt: '74in',
      ecl: 'grn',
      iyr: '2012',
      eyr: '2030',
      byr: '1980',
      hcl: '#623a2f'
    )

    refute passport.valid_advanced?
  end
end


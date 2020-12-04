require 'minitest/autorun'
require_relative 'passports_file'

class PassportsFileTest < Minitest::Test
  def test_basic
    file = PassportsFile.new('./fixtures/basic_input')
    expected = [{ hcl: '#ae17e1', iyr: '2013' }].map { |fields| Passport.new(fields) }

    assert_equal expected, file.passports
  end

  def test_multiple_passports
    file = PassportsFile.new('./fixtures/multiple_passports')
    expected = [
      { hcl: '#ae17e1', iyr: '2013' },
      { eyr: '2024' },
      { ecl: 'brn', pid: '760753108' }
    ].map { |fields| Passport.new(fields) }

    assert_equal expected, file.passports
  end

  def test_data_on_multiple_lines
    file = PassportsFile.new('./fixtures/data_on_multiple_lines')
    expected = [
      { hcl: '#ae17e1', iyr: '2013' },
      { eyr: '2024' },
      { ecl: 'brn', pid: '760753108', hgt: '179cm' }
    ].map { |fields| Passport.new(fields) }

    assert_equal expected, file.passports
  end
end

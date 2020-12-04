require 'minitest/autorun'
require_relative 'field_types'

class YearTest < Minitest::Test
  def test_length
    assert Year.valid?('2020', 2000..2020)
    refute Year.valid?('20200', 2000..2020)
    refute Year.valid?('202', 2000..2020)
  end

  def test_value
    assert Year.valid?('1920', 1920..2020)
    refute Year.valid?('1919', 1920..2020)
    assert Year.valid?('2020', 1920..2020)
    refute Year.valid?('2021', 1920..2020)
  end
end

class HeightTest < Minitest::Test
  def test_cm
    assert Height.valid?('150cm')
    assert Height.valid?('193cm')
    refute Height.valid?('149cm')
    refute Height.valid?('194cm')
    refute Height.valid?('193')
  end

  def test_in
    assert Height.valid?('59in')
    assert Height.valid?('76in')
    refute Height.valid?('58in')
    refute Height.valid?('77in')
    refute Height.valid?('59')
  end
end

class HairColorTest < Minitest::Test
  def test_length
    assert HairColor.valid?('#fe432a')
    refute HairColor.valid?('#fe432')
    refute HairColor.valid?('#fe432aa')
  end

  def test_format
    assert HairColor.valid?('#000000')
    assert HairColor.valid?('#ffffff')
    assert HairColor.valid?('#aaaaaa')
    assert HairColor.valid?('#999999')
    refute HairColor.valid?('%fe432a')
    refute HairColor.valid?('#fe432x')
  end
end

class EyeColorTest < MiniTest::Test
  def test_valid
    assert EyeColor.valid?('amb')
    assert EyeColor.valid?('blu')
    assert EyeColor.valid?('brn')
    assert EyeColor.valid?('gry')
    assert EyeColor.valid?('grn')
    assert EyeColor.valid?('hzl')
    assert EyeColor.valid?('oth')
    refute EyeColor.valid?('ott')
  end
end

class PassportIdTest < Minitest::Test
  def test_length
    assert PassportId.valid?('123456789')
    refute PassportId.valid?('1234567890')
    refute PassportId.valid?('12345678')
  end

  def test_format
    refute PassportId.valid?('1234567x90')
    refute PassportId.valid?('1234567_90')
  end
end

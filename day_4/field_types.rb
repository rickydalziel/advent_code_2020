class Year
  def self.valid?(value, range)
    format = /^\d{4}$/
    return false unless value.match(format)

    range.include?(value.to_i)
  end
end

class BirthYear
  def self.valid?(value)
    Year.valid?(value, 1920..2020)
  end
end

class IssueYear
  def self.valid?(value)
    Year.valid?(value, 2010..2020)
  end
end

class ExpirationYear
  def self.valid?(value)
    Year.valid?(value, 2020..2030)
  end
end

class Height
  def self.valid?(value)
    format = /^(?<number>\d+)(?<unit>in|cm)$/
    parsed = value.match(format)
    return false if parsed.nil?

    number = parsed[:number].to_i
    if parsed[:unit] == 'cm'
      (150..193).include?(number)
    else
      (59..76).include?(number)
    end
  end
end

class HairColor
  def self.valid?(value)
    format = /^#[a-f0-9]{6}$/
    value.match(format)
  end
end

class EyeColor
  def self.valid?(value)
    ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?(value)
  end
end

class PassportId
  def self.valid?(value)
    format = /^\d{9}$/
    value.match(format)
  end
end

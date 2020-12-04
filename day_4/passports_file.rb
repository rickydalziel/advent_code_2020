class PassportsFile
  def initialize(filename)
    @filename = filename
  end

  def passports
    @passports ||= build_passport_list
  end

  private

  attr_reader :filename

  def build_passport_list
    raw_data = File.read(filename)
    data_sets = sanitize_data_set(raw_data)
    @passports = data_sets.map { |s| build_passport(s) }
  end

  def sanitize_data_set(raw_data)
    raw_data.split(/\n{2,}/).map { |d| d.gsub("\n", " ") }
  end

  def build_passport(data_string)
    pairs = data_string.split(' ')
    fields = pairs.each_with_object({}) do |pair, hash|
      key, value = pair.split(':')
      hash[key.to_sym] = value
    end
    Passport.new(fields)
  end
end

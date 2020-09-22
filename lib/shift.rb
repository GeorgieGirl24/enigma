class Shift
  def self.squared_number(number)
    (number.to_i * number.to_i)
  end

  def self.last_four_digits(number)
    number.to_s[-4..-1].to_i
  end

  def self.find_offset(date)
    last_four_digits(squared_number(date))
  end

  def self.key_values(key)
    key.chars.each_cons(2).map do |numbers|
      numbers.join.to_i
    end
  end

  def self.make_offset_into_array(key, date)
    find_offset(date).to_s.each_char.each_slice(1).map do |character|
      character.join.to_i
    end
  end

  def self.combine_key_and_offset(key, date)
    key_values(key).zip(make_offset_into_array(key,date))
  end

  def self.find_the_sum(key, date)
    combine_key_and_offset(key, date).map do |set|
      set.sum
    end
  end
end

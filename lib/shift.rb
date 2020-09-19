# this is going to be full of class methods
class Shift
  def self.squared_number(offset)
    (offset.to_i * offset.to_i).to_s
  end

  def self.last_four_digits(offset)
  end

  def self.key_values(key)
    key.chars.each_cons(2).map do |numbers|
      numbers.join.to_i
    end
  end

  def self.find_the_shift(key, offset)
    last_four_digits(offset).chars.map.with_index do |value, index|
      key_values(key) + 0
    end
    # offset.chars.map.with_index do |value, index|
    #   require 'pry';binding.pry
    #   value.to_i + key[index].to_i
    # end
  end
end

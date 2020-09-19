# this is going to be full of class methods
class Shift
  def self.squared_number(offset)
    (offset.to_i * offset.to_i).to_s
  end

  def self.last_four_digits(offset)
    self.squared_number(offset)[-4..-1]
  end

  def self.key_values(key)
    key.chars.each_cons(2).map do |numbers|
      numbers.join.to_i
    end
  end

  def self.find_the_shift
    
  end
end

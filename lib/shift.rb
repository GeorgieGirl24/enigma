class Shift
  def self.squared_number(offset)
    (offset.to_i * offset.to_i)
  end

  def self.last_four_digits(offset)
    offset.to_s[-4..-1].to_i
  end

  def self.key_values(key)
    key.chars.each_cons(2).map do |numbers|
      numbers.join.to_i
    end
  end

  def self.combine_key_and_offset(key, offset)
    key.zip(offset.to_s.each_char.each_slice(1).map do |char|
      char.join.to_i
    end)

  end
  def self.find_the_sum(key, offset)
    combine_key_and_offset(key, offset).map do |set|
      set.sum
    end
  end

  def self.find_the_shift(key, offset)
    (:A..:D).to_a.zip(find_the_sum(key, offset)).to_h
  end
end

require './lib/shift'

class Translate
  def self.make_alphabet
    ('a'..'z').to_a << ' '
  end

  def self.find_letters_index(letter)
    make_alphabet.index(letter)
  end

  def self.find_indexes_letter(index)
    make_alphabet[index]
  end

  def self.get_code_break(key, offset)
    Shift.find_the_shift(key, offset)
    require 'pry';binding.pry
  end
end

require './lib/shift'

class Translate
  A_SHIFT = (0..1_000_000_000)
  def self.make_alphabet
    ('a'..'z').to_a << ' '
  end

  def self.find_letters_index(letter)
    make_alphabet.index(letter)
  end

  def self.find_indexes_letter(index)
    make_alphabet[index]
  end

  def self.get_code_break(key, shift)
    Shift.find_the_shift(key, shift)
    # require 'pry';binding.pry
  end

  def self.shift_character(character, shift, direction)
    make_alphabet[find_letters_index(character).send(direction, shift) % 27]
  end

  def self.translate(text, key, date, direction)
    seperate_letters = text.each_char.map do |letter|
      letter
    end
    hash = {}
    seperate_letters.each_with_index do |letter, index|
      hash[index] = letter
    end
    hash
  end
end

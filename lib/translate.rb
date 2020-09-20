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

  def self.get_code_break(key, shift)
    Shift.find_the_shift(key, shift)
  end

  def self.shift_characters(character, shift, direction)
    make_alphabet[find_letters_index(character).send(direction, shift)]
  end

end

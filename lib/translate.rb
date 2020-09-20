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
end

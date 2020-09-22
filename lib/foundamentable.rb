module Foundamentable
  def make_alphabet
    ('a'..'z').to_a << ' '
  end

  def find_letters_index(letter)
    make_alphabet.index(letter)
  end

  def find_indexes_letter(index)
    make_alphabet[index]
  end
end

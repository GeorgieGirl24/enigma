require './lib/shift'
require './lib/foundamentable'

class Translate
  extend Foundamentable

  def self.get_code_break(key, date)
    Shift.find_the_sum(key, date)
  end

  def self.shifted_character(character, shift, direction)
    make_alphabet[find_letters_index(character).send(direction, shift) % 27]
  end

  def self.translate(text, key, date, direction)
    the_keys = get_code_break(key, date)
    text.downcase.chars.reduce("") do |collector, character|
      next collector + character if !make_alphabet.include?(character)
      the_keys.rotate!(1) unless collector.empty?
      collector.concat(shifted_character(character, the_keys[0], direction))
    end
  end

  def self.encryption(text, key, date)
    translate(text, key, date, :+)
  end

  def self.decryption(text, key, date)
    translate(text, key, date, :-)
  end
end

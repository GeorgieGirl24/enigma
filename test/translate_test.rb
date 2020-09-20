require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require './lib/shift'
require 'mocha/minitest'


class TranslateTest < Minitest::Test
  def setup
    @translate = Translate.new
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Translate, @translate
    assert_instance_of Shift, @shift
  end

  def test_it_can_set_up_an_alphabet
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, Translate.make_alphabet
    assert_equal 27, Translate.make_alphabet.count
  end

  def test_it_can_find_a_letters_index
    letter = 'a'
    assert_equal 0, Translate.find_letters_index(letter)
  end

  def test_it_can_find_an_indexes_letter
    index = 12
    assert_equal 'm', Translate.find_indexes_letter(index)
  end

  def test_it_can_take_a_return_value_from_shift_class
    arg_1 = [02, 27, 71, 15]
    arg_2 = 1025
    expected = { A: 3, B: 27, C: 73, D: 20 }
    assert_equal expected, Translate.get_code_break(arg_1, arg_2)
  end

  def test_i_can_take_one_character_and_shift_appropriately
    character = 'h'
    arg_1 = [02, 27, 71, 15]
    arg_2 = 1025
    shift = Translate.get_code_break(arg_1, arg_2)[:A]
    direction = :+
    assert_equal 'k' ,Translate.shift_characters(character, shift, direction)
    character = 'h'
    arg_1 = [02, 27, 71, 15]
    arg_2 = 1025
    shift = Translate.get_code_break(arg_1, arg_2)[:A]
    direction = :-
    assert_equal 'e' ,Translate.shift_characters(character, shift, direction)
  end

  def test_it_can_seperate_a_strings_characters_into_a_character
  end

  def test_it_can_generate_translation

  end

  def test_it_has_a_string_to_read_
  end

  def test_it_can_take_a_string_and_count
  end
end

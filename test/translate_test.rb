require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require './lib/shift'
require 'mocha/minitest'


class TranslateTest < Minitest::Test
  def setup
    # enigma = Enigma.new
    # enigma.encrypt
    @message = 'hello world!'
    @key = '02715'
    @date = '040895'
    # Enigma.stubs(:encrypt).with(@message, @key, @date).returns()

    @translate = Translate.new
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Translate, @translate
    assert_instance_of Shift, @shift
  end

  def test_it_can_set_up_an_alphabet
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    assert_equal expected, Translate.make_alphabet
    assert_equal 27, Translate.make_alphabet.count
  end

  def test_it_can_find_a_letters_index
    letter = 'a'
    assert_equal 0, Translate.find_letters_index(letter)
    letter = 'z'
    assert_equal 25, Translate.find_letters_index(letter)
    letter = ' '
    assert_equal 26, Translate.find_letters_index(letter)
  end

  def test_it_can_find_an_indexes_letter
    index = 12
    assert_equal 'm', Translate.find_indexes_letter(index)
    index = 26
    assert_equal ' ', Translate.find_indexes_letter(index)
    index = 18
    assert_equal 's', Translate.find_indexes_letter(index)
  end

  def test_it_can_take_a_return_value_from_shift_class
    arg_1 = [02, 27, 71, 15]
    arg_2 = 1025
    expected = [3, 27, 73, 20]
    assert_equal expected, Translate.get_code_break(arg_1, arg_2)
  end

  def test_i_can_take_one_character_and_shift_appropriately
    character = 'h'
    arg_1 = [02, 27, 71, 15]
    arg_2 = 1025
    shift = Translate.get_code_break(arg_1, arg_2)[0]
    direction = :+
    assert_equal 'k' ,Translate.shift_character(character, shift, direction)
    character = 'h'
    arg_1 = [02, 27, 71, 15]
    arg_2 = 1025
    shift = Translate.get_code_break(arg_1, arg_2)[0]
    direction = :-
    assert_equal 'e' ,Translate.shift_character(character, shift, direction)
  end

  def test_it_can_generate_encryption_using_key_and_date
    Shift.expects(:get_code_break).returns([3, 27, 73, 20])
    text = 'hello world'
    expcted = 'keder ohulw'
    date = '040895'
    key = '02715'
    direction = :+
    assert_equal expcted, Translate.translate(text, key, date, direction)
  end

  def test_it_can_generate_translation_using_key

  end

  def test_it_can_generate_translation_using_only_message

  end

  def test_it_can_encrypt_message
  end

  def test_it_can_decrypt_message
  end

  def test_it_can_have_a_return_message

  end
end

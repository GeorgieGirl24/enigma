require './test/test_helper'
require './lib/translate'
require './lib/shift'
require './lib/foundamentable'



class TranslateTest < Minitest::Test
  def setup
    @translate = Translate.new
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Translate, @translate
    assert_instance_of Shift, @shift
  end

  def test_it_can_take_a_return_value_from_shift_class
    date = '040895'
    key = '02715'
    expected = [3, 27, 73, 20]
    assert_equal expected, Translate.get_code_break(key, date)
  end

  def test_i_can_take_one_character_and_shift_appropriately

    character = 'h'
    date = '040895'
    key = '02715'
    shift = Translate.get_code_break(key, date)[0]
    direction = :+
    assert_equal 'k' ,Translate.shifted_character(character, shift, direction)

    character = 'h'
    date = '040895'
    key = '02715'
    shift = Translate.get_code_break(key, date)[0]
    direction = :-
    assert_equal 'e' ,Translate.shifted_character(character, shift, direction)
  end

  def test_it_can_generate_encryption_using_key_and_date
    text = 'hello world!'
    date = '040895'
    key = '02715'
    direction = :+
    expcted = 'keder ohulw!'
    assert_equal expcted, Translate.translate(text, key, date, direction)

    text = 'hello world!'
    date = '040895'
    key = '02715'
    direction = :-
    expected_1 = 'eetsl dvoll!'
    assert_equal expected_1, Translate.translate(text, key, date, direction)
  end

  def test_it_can_find_encryption
    text = 'hello world!'
    date = '040895'
    key = '02715'
    expected = 'keder ohulw!'
    assert_equal expected, Translate.encryption(text, key, date)
  end

  def test_it_can_find_another_encryption
    text = 'we can do this!'
    date = '200920'
    key = '02715'
    expected = 'diqrirqswdjwqw!'
    assert_equal expected, Translate.encryption(text, key, date)
  end

  def test_it_can_handle_encryption_with_all_non_alphabet_characters
    text = '*&@#$'
    date = '040895'
    key = '02715'
    expected = '*&@#$'
    assert_equal expected, Translate.encryption(text, key, date)
  end

  def test_it_can_find_decryption
    text = 'hello world!'
    date = '040895'
    key = '02715'
    expected = 'eetsl dvoll!'
    unexpected = 'hello world!'
    assert_equal expected, Translate.decryption(text, key, date)
    refute_equal unexpected, Translate.decryption(text, key, date)
  end

  def test_it_can_handle_decryption_with_all_non_alphabet_characters
    text = '*&@#$'
    date = '040895'
    key = '02715'
    expected = '*&@#$'
    assert_equal expected, Translate.decryption(text, key, date)
  end
end

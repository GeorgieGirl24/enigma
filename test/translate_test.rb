require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require 'mocha/minitest'

class TranslateTest < Minitest::Test
  def setup
    @translate = Translate.new
  end

  def test_it_exists
    assert_instance_of Translate, @translate
  end

  def test_it_can_set_up_an_alphabet
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, Translate.make_alphabet
  end

  def test_it_can_find_a_letters_index
    letter = 'a'
    assert_equal 0, Translate.find_letters_index(letter)
  end

  def test_it_can_find_an_indexes_letter
    index = 12
    assert_equal 'm', Translate.find_indexes_letter(index)
  end

  def test_it_has_a_string_to_read
  end

  def test_it_can_take_a_string_and_count
  end
end

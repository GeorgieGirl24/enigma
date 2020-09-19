require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require './lib/shift'
require 'mocha/minitest'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_square_a_six_digit_number
    offset = '040895'
    assert_equal '1672401025', Shift.squared_number(offset)
  end

  def test_it_can_find_the_last_four_digits
    offset = '040895'
    assert_equal '1025', Shift.last_four_digits(offset)
  end

  def test_it_can_split_up_the_key_value
    key = '02715'
    assert_equal [02, 27, 71, 15], Shift.key_values(key)
  end

  def test_it_can_add_the_find_the_shift
    key = '02715'
    offset = '040895'

    expected = {A: 3, B: 27, C: 73, D: 20}
    assert_equal expected, Shift.find_the_shift(key, offset)
  end
end

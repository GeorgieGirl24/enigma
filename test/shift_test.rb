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
    number = '040895'
    assert_equal 1672401025, Shift.squared_number(number)
  end

  def test_it_can_find_the_last_four_digits
    number = '040895'
    squared_number = Shift.squared_number(number)
    assert_equal 1025, Shift.last_four_digits(squared_number)
  end

  def test_it_can_split_up_the_key_value
    key = '02715'
    assert_equal [02, 27, 71, 15], Shift.key_values(key)
  end

  def test_it_can_add_the_find_the_shift
    number = '040895'
    number_1 = '02715'
    squared_number = Shift.squared_number(number)
    assert_equal 1672401025, Shift.squared_number(number)

    offset = Shift.last_four_digits(squared_number)
    assert_equal 1025, offset

    key = Shift.key_values(number_1)
    expected = {A: 3, B: 27, C: 73, D: 20}
    assert_equal expected, Shift.find_the_shift(key, offset)
  end

  def test_it_can_combine_key_and_offset
    number = '040895'
    number_1 = '02715'
    squared_number = Shift.squared_number(number)
    offset = Shift.last_four_digits(squared_number)
    key = Shift.key_values(number_1)
    expected = [[02, 1], [27, 0], [71, 2], [15, 5]]
    assert_equal expected, Shift.combine_key_and_offset(key, offset)
  end

  def test_it_can_find_the_sum
    number = '040895'
    number_1 = '02715'
    squared_number = Shift.squared_number(number)
    offset = Shift.last_four_digits(squared_number)
    key = Shift.key_values(number_1)
    assert_equal [3, 27, 73, 20], Shift.find_the_sum(key, offset)
  end
end

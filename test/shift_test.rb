require './test/test_helper'
require './lib/shift'


class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_square_a_six_digit_number
    date = '040895'
    assert_equal 1672401025, Shift.squared_number(date)
    refute_equal 8304720385, Shift.squared_number(date)
  end

  def test_it_can_find_the_last_four_digits
    date = '040895'
    squared_number = Shift.squared_number(date)
    assert_equal 1025, Shift.last_four_digits(squared_number)
    refute_equal 2148, Shift.last_four_digits(squared_number)
  end

  def test_it_can_split_up_the_key_value
    key = '02715'
    assert_equal [02, 27, 71, 15], Shift.key_values(key)
    key_1 = '12345'
    assert_equal [12, 23, 34, 45], Shift.key_values(key_1)
  end

  def test_it_can_combine_key_and_offset
    date = '040895'
    key = '02715'
    expected = [[02, 1], [27, 0], [71, 2], [15, 5]]
    unexpected = [[02, 1], [27, 1], [71, 2], [16, 5]]
    assert_equal expected, Shift.combine_key_and_offset(key, date)
    refute_equal unexpected, Shift.combine_key_and_offset(key, date)
  end

  def test_it_can_find_the_sum
    date = '040895'
    key = '02715'
    assert_equal [3, 27, 73, 20], Shift.find_the_sum(key, date)
    date_1 = '190920'
    key_1 = '12345'
    assert_equal [18, 27, 34, 45], Shift.find_the_sum(key_1, date_1)
  end

  def test_it_can_find_the_offset_by_date
    date = '040895'
    assert_equal 1025, Shift.find_offset(date)
    refute_equal 4580, Shift.find_offset(date)
  end

  def test_it_can_make_an_offset_into_an_array
    date = '040895'
    key = '02715'
    assert_equal [1, 0, 2, 5], Shift.make_offset_into_array(key, date)
    refute_equal [0, 1, 2, 5], Shift.make_offset_into_array(key, date)
  end
end

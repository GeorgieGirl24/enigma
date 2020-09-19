require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require './lib/shift'
require 'mocha/minitest'

class ShiftTest < Minitest::Test
  def test_it_exists
    shift = Shift.new
    assert_instance_of Shift, shift 
  end
end

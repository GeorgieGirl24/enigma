require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require 'mocha/minitest'

class CommandCenterTest < Minitest::Test
  def setup
    File.expects(:read).with('message.txt').returns('hello world!')
    @setup_input_1 = ['message.txt', 'encrypted.txt', '02715', '040895']
    @command_center_1 = CommandCenter.new(@setup_input_1)

    File.expects(:read).with('encrypted.txt').returns('keder ohulw!')
    @setup_input_2 = ['encrypted.txt', 'decrypted.txt']
    @command_center_2 = CommandCenter.new(@setup_input_2)
  end

  def test_it_exists
    assert_instance_of CommandCenter, @command_center_1
    assert_instance_of CommandCenter, @command_center_2
  end

  def test_it_has_attributes
    assert_equal 'message.txt', @command_center_1.input_file
    assert_equal 'encrypted.txt', @command_center_1.output_file
    assert_equal '02715', @command_center_1.key
    assert_equal '040895', @command_center_1.date
    assert_nil @command_center_2.key
    assert_nil @command_center_2.date
  end

end

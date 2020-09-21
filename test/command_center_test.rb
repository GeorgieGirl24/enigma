require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require './lib/shift'
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
    assert_equal @setup_input_1[0], @command_center_1.input_file
    assert_equal @setup_input_1[1], @command_center_1.output_file
    assert_equal @setup_input_1[2], @command_center_1.key
    assert_equal @setup_input_1[3], @command_center_1.date
    assert_nil @command_center_2.key
    assert_nil @command_center_2.date
  end

  def test_it_can_read_in_a_file
    assert_equal 'hello world!', @command_center_1.message
  end

  def test_it_can_can_create_an_enigma_class
    assert_instance_of Enigma, @command_center_1.enigma
  end

  # def test_that_it_can_write_to_a_file
  #   File.expects(:write).with('encrypted.txt').returns('keder ohulw!')
  #   @command_center_1.write_to_a_file('encrypted.txt', 'keder ohulw!')
  # end

  def test_it_can_send_an_output_to_the_screen_for_decryption
    @command_center_1.stubs(:decryption_message).returns('decrypted.txt')
    expected = "Created 'decrypted.txt' with the key 02715 and date 040895"
    assert_equal expected, @command_center_1.decryption_message
  end

  def test_it_can_send_an_out_put_message_for_encryption
    enigma = Enigma.new
    the_encryption = enigma.encrypt(@command_center_1.message, @command_center_1.key, @command_center_1.date)
    expected = "Created 'encrypted.txt' with the key #{the_encryption[:key]} and date #{the_encryption[:date]}"
    assert_equal expected, @command_center_1.encryption_message
  end

  def test_it_can_create_a_return_hash

  end

  def test_it_can_make_an_encryption_pattern

  end

  def test_it_can_make_a_decryption_pattern

  end

  def test_it_can_know_what_the_current_key_and_date_are

  end
end

require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require './lib/shift'
require 'mocha/minitest'

class CommandCenterTest < Minitest::Test
  def setup
    @encrypt_message = File.expects(:read).with('message.txt').returns('hello world!')
    @setup_input_1 = ['message.txt', 'encrypted.txt']
    @command_center_1 = CommandCenter.new(@setup_input_1)

    File.expects(:read).with('encrypted.txt').returns('keder ohulw!')
    @setup_input_2 = ['encrypted.txt', 'decrypted.txt', '02715', '040895']
    @command_center_2 = CommandCenter.new(@setup_input_2)
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of CommandCenter, @command_center_1
    assert_instance_of CommandCenter, @command_center_2
  end

  def test_it_has_attributes
    assert_equal @setup_input_2[0], @command_center_2.input_file
    assert_equal @setup_input_2[1], @command_center_2.output_file
    assert_equal @setup_input_2[2], @command_center_2.key
    assert_equal @setup_input_2[3], @command_center_2.date
    assert_equal @setup_input_1[0], @command_center_1.input_file
    assert_equal @setup_input_1[1], @command_center_1.output_file
    assert_nil @command_center_1.key #encrypt
    assert_nil @command_center_1.date #encrypt
  end

  def test_it_can_read_in_a_file
    assert_equal 'hello world!', @command_center_1.message
    assert_equal 'keder ohulw!', @command_center_2.message
  end

  def test_it_can_can_create_an_enigma_class
    assert_instance_of Enigma, @command_center_1.enigma
    assert_instance_of Enigma, @command_center_2.enigma
  end

  def test_that_it_can_write_to_a_file
    File.expects(:write).with('encrypted.txt', 'keder ohulw!').returns('keder ohulw!')
    assert_equal 'keder ohulw!', @command_center_1.write_to_a_file('encrypted.txt', 'keder ohulw!')
  end

  def test_it_can_make_an_encryption_pattern
    File.expects(:read).with("message.txt").returns('hello world!')
    intended = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    @enigma.stubs(:encrypt).with('hello world!').returns(intended)
    expected = "Created 'encrypted.txt' with key #{intended[:key]} and date #{intended[:date]}"
    assert_equal expected, @command_center_1.encrypt_pattern
  end

  def test_it_can_make_a_decryption_pattern
    File.expects(:read).with("encrypted.txt").returns('keder ohulw!')
    intended = {
      decryption: 'hello world!',
      key: '02715',
      date: '040895'
    }
    @enigma.stubs(:decrypt).with('keder ohulw!', '02715', '040895').returns(intended)

    expected = "Created 'decrypted.txt' with key #{intended[:key]} and date #{intended[:date]}"
    assert_equal expected, @command_center_2.decrypt_pattern
  end

  def test_it_can_have_access_to_the_current_hash
    File.expects(:read).with("encrypted.txt").returns('keder ohulw!')

    expected = {
      decryption: 'hello world!',
      key: 02715,
      date: '040895'
    }
    assert_equal expected,@command_center_1.translated_hash
  end
  # def test_it_can_send_an_output_to_the_screen_for_decryption
  #   skip
  #   @command_center_1.stubs(:decryption_message).returns('decrypted.txt')
  #   expected = "Created 'decrypted.txt' with the key 02715 and date 040895"
  #   assert_equal expected, @command_center_1.decryption_message
  # end
  def test_it_can_update_what_the_current_key_and_date_are
    # skip
    @command_center_1.encrypt_pattern
    @command_center_1.update_key_and_date

    assert_equal '0215', @command_center_1.key
    assert_equal '040895', @command_center_1.date
  end
end

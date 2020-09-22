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
    intended = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    @command_center_1.enigma.stubs(:encrypt).with('hello world!').returns(intended)
    @command_center_1.stubs(:update_key_and_date).with(intended)
    @command_center_1.stubs(:write_to_a_file).with('encrypted.txt','keder ohulw!')

    expected = "Created 'encrypted.txt' with key #{intended[:key]} and date #{intended[:date]}"
    assert_nil @command_center_1.encrypt_pattern
  end

  # def test_it_can_generate_the_correct_pattern_of_encryption
  #   intended = {
  #     encryption: 'keder ohulw!',
  #     key: '02715',
  #     date: '040895'
  #   }
  #   @command_center_1.enigma.encrypt('hello world!', '02715', '040895')
  #   File.read('message.txt').chomp
  #   @command_center_1.write_to_a_file(@command_center_1.output_file, intended[:encryption])
  #   @command_center_1.update_key_and_date(intended)
  #   assert_nil @command_center_1.encrypt_pattern
  # end


  def test_it_can_make_a_decryption_pattern
    arguments = ['encrypted.txt', 'decrypted.txt', '02715', '040895']
    File.expects(:read).with('encrypted.txt').returns('keder ohulw!')
    command_center = CommandCenter.new(arguments)
    intended = {
      decryption: 'hello world!',
      key: '02715',
      date: '040895'
    }

    expected = "Created 'decrypted.txt' with key #{intended[:key]} and date #{intended[:date]}"
    assert_nil command_center.decrypt_pattern
  end

  def test_it_can_update_what_the_current_key_and_date
    expected = {
      decryption: 'hello world!',
      key: '02715',
      date: '040895'
    }
    @command_center_1.stubs(:translated_hash).returns(expected)
    @command_center_1.stubs(:update_key_and_date)

    assert_equal '02715', @command_center_2.key
    assert_equal '040895', @command_center_2.date
  end
end

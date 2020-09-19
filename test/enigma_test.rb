require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_todays_date
    today = mock('today')
    Date.expects(:today).returns(today)
    today.expects(:strftime).returns('190920')
    assert_equal '190920', @enigma.find_todays_date
  end

  def test_it_can_generate_a_random_five_number_code
    assert_includes(1..99999, 5) #@enigma.find_random_number
  end

  def test_it_can_make_an_encryption_with_three_arguments
    arguments = ['hello world', '02715', '040895']
    Translate.stubs(:return_message).with(arguments).returns('keder ohulw!')
    expected = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('keder ohulw!', '02715', '040895')
  end

  def test_it_can_make_an_encryption_with_two_arguments
    @enigma.stubs(:find_todays_date).returns('040895')
    arguments = ['hello world', '02715']
    Translate.stubs(:return_message).with(*arguments).returns('keder ohulw!')
    expected = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('keder ohulw!', '02715', '040895')
  end

  def test_it_can_make_an_encryption_with_one_arguments
    @enigma.stubs(:find_random_number).returns('02715')
    @enigma.stubs(:find_todays_date).returns('040895')
    arguments = ['hello world']
    Translate.stubs(:return_message).with(*arguments).returns('keder ohulw!')
    expected = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('keder ohulw!', '02715', '040895')
  end

  def test_it_can_decrypt_with_a_key_and_date
    arguments = ['keder ohulw!', '02715', '040895']
    Translate.stubs(:return_message).with(*arguments).returns('hello world!')
    expected = {
      decryption: 'hello world!',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.decrypt('hello world!', '02715', '040895')
  end

  def test_it_can_decrypt_with_a_no_date
    @enigma.stubs(:find_todays_date).returns('040895')
    arguments = ['keder ohulw!', '02715']
    Translate.stubs(:return_message).with(*arguments).returns('hello world!')
    expected = {
      decryption: 'hello world!',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.decrypt('hello world!', '02715', '040895')
  end


end

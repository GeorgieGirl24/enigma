require './test/test_helper'
require './lib/state'
require './lib/enigma'
require './lib/decrypted_phrase'
require './lib/encrypted_phrase'
require './lib/decryption'
require './lib/encryption'

class EnigmaTest < Minitest::Test
  def setup
    encrypted_path = './data/encrypted.txt'
    decrypted_path = './data/decrypted.txt'

    locations = {
      encrypted: encrypted_path,
      decrypted: decrypted_path
    }

    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_load_cryption
    expected = 0
    assert_equal expected, @enigma.load_cryption
  end
  def test_it_can_load_state_machine

  end
end

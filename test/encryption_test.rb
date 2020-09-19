require './test/test_helper'
require './lib/enigma'
require './lib/state'
require 'mocha/minitest'
require './lib/encryption'

class EncryptionTest < Minitest::Test
  def setup
    encrypted_path = './data/encrypted.txt'
    decrypted_path = './data/decrypted.txt'

    locations = {
      encrypted: encrypted_path,
      decrypted: decrypted_path
    }
    enigma = mock('enigma')
    enigma.stubs(:class).returns(Enigma)
    # @state_machine = State.new(locations, enigma)
    @encryption = Encryption.new(locations, enigma)
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end
end

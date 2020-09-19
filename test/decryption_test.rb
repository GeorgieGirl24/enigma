require './test/test_helper'
require './lib/enigma'
require './lib/state'
require 'mocha/minitest'
require './lib/decryption'

class DecryptionTest < Minitest::Test
  def setup
    encrypted_path = './data/encrypted.txt'
    decrypted_path = './data/decrypted.txt'

    locations = {
      encrypted: encrypted_path,
      decrypted: decrypted_path
    }
    # enigma = mock('state')
    # enigma.stubs(:class).returns(Enigma)
    enigma = Enigma.from_txt(locations)
    # state = mock('state')
    # state.stubs(:class).returns(State)
    # state_machine = State.new(locations, enigma)
    @decryption = Decryption.new(locations, enigma)
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end
end

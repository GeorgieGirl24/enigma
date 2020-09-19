require './test/test_helper'
require './lib/enigma'
require './lib/state'
require 'mocha/minitest'

class StateTest < Minitest::Test
  def setup
    encrypted_path = './data/encrypted.txt'
    decrypted_path = './data/decrypted.txt'

    locations = {
      encrypted: encrypted_path,
      decrypted: decrypted_path
    }
    enigma = mock('enigma')
    enigma.stubs(:class).returns(Enigma)
    @state_machine = State.new(locations, enigma)
  end

  def test_it_exists
    assert_instance_of State, @state_machine
  end
end

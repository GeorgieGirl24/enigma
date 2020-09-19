require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    encrypted_path = './data/encrypted.txt'
    decrypted_path = '/data/decrypted.txt'

    locations = {
      encrypted: encrypted_path,
      decrypted: decrypted_path
    }

    @enigma = Enigma.from_txt(locations)
  end

  def test_it_exists_and_has_attributes

    assert_instance_of Enigma, @enigma
  end
end

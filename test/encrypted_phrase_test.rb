require './test/test_helper'
require './lib/enigma'
require './lib/file_io'
require './lib/letter'
require './lib/encrypted_phrase'
require 'mocha/minitest'

class EncryptedPhraseTest < Minitest::Test
  def test_it_exists
    encrypted_phrase = EncryptedPhrase.new(["hello world"])
    assert_instance_of EncryptedPhrase, encrypted_phrase
  end
end

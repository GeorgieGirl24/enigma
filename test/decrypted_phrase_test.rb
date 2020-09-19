require './test/test_helper'
require './lib/enigma'
require './lib/file_io'
require './lib/letter'
require './lib/decrypted_phrase'
require 'mocha/minitest'

class DecryptedPhraseTest < Minitest::Test
  def test_it_exists
    decrypted_phrase = DecryptedPhrase.new(["hello world"])
    assert_instance_of DecryptedPhrase, decrypted_phrase
  end
end

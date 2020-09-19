require './test/test_helper'
require './lib/enigma'
require './lib/file_io'
require './lib/letter'
require './lib/encrypted_phrase'
require './lib/decrypted_phrase'
require 'mocha/minitest'

class FileIOTest < Minitest::Test
  def test_it_can_load_decrypted
    decrypted = FileIO.load_decrypted('./dummy_folder/dummy_decrypted.txt')
    assert_equal 1, decrypted.length
  end

  def test_it_can_load_encrypted
    encrypted = FileIO.load_encrypted('./dummy_folder/dummy_encrypted.txt')
    assert_equal 1, encrypted.length
  end

  # def test_it_can_make_encrypted_object
  #   encrypted = FileIO.load_encrypted('./dummy_folder/dummy_encrypted.txt')
  #
  #   scrabbled = EncryptedPhrase.new(encrypted)
  #   expected = assert_instance_of EncryptedPhrase, scrabbled
  #   assert_equal expected, make_an_object
  # end
end

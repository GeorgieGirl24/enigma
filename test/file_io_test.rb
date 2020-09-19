require './test/test_helper'
require './lib/enigma'
require './lib/file_io'
require './lib/letter'
require 'mocha/minitest'

class FileIOTest < Minitest::Test
  def test_it_can_load_decrypted
    decrypted = FileIO.load_decrypted('./dummy_folder/dummy_decrypted.txt')
    assert_equal 1, decrypted.length
  end
end

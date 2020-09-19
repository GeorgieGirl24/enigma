require './test/test_helper'
require './lib/enigma'
require './lib/file_io'
require './lib/letter'
require 'mocha/minitest'

class LetterTest < Minitest::Test
  def test_it_exists
    letter = Letter.new("a")

    assert_instance_of Letter, letter
  end
end

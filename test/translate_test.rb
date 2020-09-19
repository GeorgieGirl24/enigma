require './test/test_helper'
require './lib/enigma'
require './lib/command_center'
require './lib/translate'
require 'mocha/minitest'

class TranslateTest < Minitest::Test
  def test_it_exists
    translate = Translate.new
    assert_instance_of Translate, translate
  end
end

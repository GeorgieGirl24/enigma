require './lib/enigma'
require './lib/command_center'

command_center = CommandCenter.new(ARGV)
command_center.encrypt_pattern

require './lib/enigma'
require './lib/command_center'

command_center = CommandCenter.new(ARGV)
command_center.decryption_message

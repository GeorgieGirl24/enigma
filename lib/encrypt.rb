require './lib/enigma'
require './lib/command_center'
# require './lib/encryption'
# require './lib/decryption'
command_center = CommandCenter.new(ARGV)
command_center.write_to_a_file

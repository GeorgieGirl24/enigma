require './lib/enigma'
require './lib/command_center'

command_center = CommandCenter.new(ARGV)
command_center.write_to_a_file

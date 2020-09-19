require './lib/enigma'
require './lib/command_center'
# require './lib/encryption'
# require './lib/decryption'

# ARGV[0] exsisting file that contains encrypted_message
# ARGV[1] should write the decrypted message
# ARGV[2] the_key
# ARGV[3] the_date
command_center = CommandCenter.new(ARGV)
command_center.write_to_a_file

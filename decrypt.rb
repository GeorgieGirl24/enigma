require './lib/enigma'
require './lib/encryption'
require './lib/decryption'

# ARGV[0] exsisting file that contains encrypted_message
# ARGV[1] should write the decrypted message
# ARGV[2] the_key
# ARGV[3] the_date
encrypted_path = './data/encrypted.txt'
decrypted_path = './data/decrypted.txt'

locations = {
  encrypted: encrypted_path,
  decrypted: decrypted_path
}

enigma = Enigma.from_txt(locations)

puts "#{the_file_it_wrote_to} #{the_key} #{the_date}"

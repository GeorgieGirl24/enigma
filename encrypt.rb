require './lib/enigma'
require './lib/encryption'
require './lib/decryption'

# original_message = ARGV[0]
# encrypted_message  = ARGV[1]

encrypted_path = './data/encrypted.txt'
decrypted_path = './data/decrypted.txt'

locations = {
  encrypted: encrypted_path,
  decrypted: decrypted_path
}


enigma = Enigma.new
puts "#{the_file_it_wrote_to} #{the_key} #{the_date}"

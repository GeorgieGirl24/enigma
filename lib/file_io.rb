class FileIO
  def self.load_decrypted(file)
    contents = File.open(file, 'r')
    decrypted = contents.map do |line|
      line.chop[1..-1].chop!
    end.flatten
    @decrypted = DecryptedPhrase.new(decrypted)
    return decrypted
  end

  def self.load_encrypted(file)
    contents = File.open(file, 'r')
    encrypted = contents.map do |line|
      line.chop[1..-1].chop!
    end.flatten
    @encrypted = EncryptedPhrase.new(encrypted)
    require 'pry';binding.pry
    return encrypted
  end

  def self.make_an_object
  end
end

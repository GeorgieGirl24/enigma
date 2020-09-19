class FileIO
  def self.load_decrypted(file)
    decrypted = []
    contents = File.open(file, 'r')
    contents.each do |line|
      line.chop.split(',')
      require 'pry';binding.pry
      decrypted << Letter.new(letter)
    end
    decrypted
  end
end

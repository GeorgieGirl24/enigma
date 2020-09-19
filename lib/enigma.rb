require_relative './file_io'

class Enigma
  attr_reader :state,
              :state_machine,
              :decrypted,
              :encrypted
  def self.from_txt(locations)
    Enigma.new
  end

  def initialize
    @state = nil
    # @locations = locations
    # @state_machine = State.new(self)
    @decrypted = decrypted
    @encrypted = encrypted
    # require 'pry';binding.pry
  end

  def load_cryption
  
  end
  # def next_state(klass=Encryption)
  #   @state = klass.new(self)
  #   # @state = Encryption.new(@locations, self)
  # end
end

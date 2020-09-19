class State

  attr_reader :enigma, :decryption, :encryption
  def initialize(locations, enigma)
    @enigma = enigma
    # @encrypted = locations[:encrypted]
    # @decrypted = locations[:decrypted]
    create_states(locations)
  end

  def create_states(locations)
    # decrypted_content = File.open(locations[:decrypted], 'w')
    # @decryption = decrypted_content.map do |content|

    @decryption = Decryption.new(locations, self)
    @encryption = Encryption.new(locations, self)
  end
end

class State

  attr_reader :enigma, :decryption, :encryption
  def initialize(enigma)
    @enigma = enigma
    # @encrypted = locations[:encrypted]
    # @decrypted = locations[:decrypted]
    create_states
  end

  def create_states
    # decrypted_content = File.open(locations[:decrypted], 'w')
    # @decryption = decrypted_content.map do |content|

    @decryption = Decryption.new(self)
    @encryption = Encryption.new(self)
  end
end

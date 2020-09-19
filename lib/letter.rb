class Letter
  attr_reader :letter, :state
  def initialize(letter, state=:decrypted)
    @letter = letter
    @state = state
  end
end

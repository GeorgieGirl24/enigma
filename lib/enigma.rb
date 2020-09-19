class Enigma
  attr_reader :state,
              :state_machine,
              :locations
  def self.from_txt(locations)
    Enigma.new(locations)
  end

  def initialize(locations)
    @state = nil
    @state_machine = State.new(locations, self)
    @locations = locations
  end

  def next_state(klass=Encryption)
    @state = klass.new(@locations, self)
    # @state = Encryption.new(@locations, self)


  end
end

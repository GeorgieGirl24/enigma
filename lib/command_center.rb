class CommandCenter
  attr_reader :input_file, :output_file, :key, :date
  def initialize(argv)
    @input_file = argv[0]
    @output_file = argv[1]
    @key = argv[2]
    @date = argv[3]
    @message = File.read(input_file).chomp
    @enigma = Enigma.new
  end

  
end

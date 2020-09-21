class CommandCenter
  attr_reader :input_file,
              :output_file,
              :key,
              :date,
              :message,
              :enigma

  def initialize(argv)
    @input_file = argv[0]
    @output_file = argv[1]
    @key = argv[2]
    @date = argv[3]
    @message = File.read(input_file).chomp
    @enigma = Enigma.new
  end

  def write_to_a_file(output_file, input_message)
    File.write(output_file, input_message)
  end

  def encrypt_pattern
    encryption_hash
    write_to_a_file(ARGV[1], encryption_hash[:encryption])
    puts "Created '#{ARGV[1]}' with key #{encryption_hash[:key]} and date #{encryption_hash[:date]}"
  end

  def encryption_hash
    @enigma.encrypt(@message)
  end

  def decrypt_pattern
    encryption_hash
    write_to_a_file(@output_file, encryption_hash[:encryption])
    puts "Created '#{@output_file}' with key #{encryption_hash[:key]} and date #{encryption_hash[:date]}"
  end
end

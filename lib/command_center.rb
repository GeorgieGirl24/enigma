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
    fixed = @enigma.encrypt(@message)
    write_to_a_file(@output_file, fixed[:encryption])
    update_key_and_date(fixed)
    puts "Created '#{@output_file}' with key #{fixed[:key]} and date #{fixed[:date]}"
  end

  def update_key_and_date(fixed)
    @key = fixed[:key]
    @date = fixed[:date]
  end

  def decrypt_pattern
    fixed = @enigma.decrypt(@message, @key, @date)
    write_to_a_file(@output_file, fixed[:decryption])
    puts "Created '#{@output_file}' with key #{fixed[:key]} and date #{fixed[:date]}"
  end
end

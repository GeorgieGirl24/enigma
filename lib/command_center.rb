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
    translated_hash = @enigma.encrypt(@message)
    write_to_a_file(@output_file, translated_hash[:encryption])
    update_key_and_date(translated_hash)
    puts "Created '#{@output_file}' with key #{translated_hash[:key]} and date #{translated_hash[:date]}"
  end

  def update_key_and_date(translated_hash)
    @key = translated_hash[:key]
    @date = translated_hash[:date]
    # require 'pry';binding.pry
  end

  def decrypt_pattern
    translated_hash = @enigma.decrypt(@message, @key, @date)
    write_to_a_file(@output_file, translated_hash[:decryption])
    puts "Created '#{@output_file}' with key #{translated_hash[:key]} and date #{translated_hash[:date]}"
  end
end

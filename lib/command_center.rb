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
    @message = File.read(input_file)
    @enigma = Enigma.new
  end

  # def write_to_a_file(output_file, input_message)
  #   File.write(output_file, input_message)
  # end
  def encrypt_pattern
      # require 'pry';binding.pry
    @engima.encrypt(@message)
    # encryption_message
  end

  # def encryption_message
  #   puts "Created '#{@output_file}' with the key #{encrypt_pattern[:key]} and date #{encrypt_pattern[:date]}"
  # end
  #
  # def decryption_message
  #   puts "Created '#{@output_file}' with the key #{@key} and date #{@date}"
  # end
end

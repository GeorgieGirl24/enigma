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
    @message = File.read(@input_file)
    @enigma = Enigma.new
  end

  def method_name

  end
  # def write_to_a_file(output_file, input_message)
  #   require 'pry';binding.pry
  #   File.write(output_file, input_message)
  # end

  def encryption_message
    # require 'pry';binding.pry
    p ARGV[0]
    @message
    # @engima.encrypt(@message, @key, @date)
    puts "Created '#{@output_file}' with the key #{@the_key} and date #{@the_date}"
  end

  def decryption_message
    puts "Created '#{@output_file}' with the key #{@key} and date #{@date}"
  end
end

require 'date'

class Enigma
  def initialize

  end

  def find_todays_date
    Date.today.strftime('%d%m%y')
  end

  def find_random_number
    rand(99999).to_s.rjust(5, '0')
  end

  def encrypt(string, key, date)
    #call a class Translate to give me answer!
    {encryption: "keder ohulw!", key: key, date: date}
  end
end

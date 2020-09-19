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
end

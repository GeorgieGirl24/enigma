require 'date'

class Enigma
  def find_todays_date
    Date.today.strftime('%d%m%y')
  end

  def find_random_number
    rand(99999).to_s.rjust(5, '0')
  end

  def encrypt(string, key=find_random_number, date=find_todays_date)
    #call a class Translate to give me answer!
    { encryption: stringAdd, key: key, date: date }
  end

  def decrypt(string, key=find_random_number, date=find_todays_date)
    #call a class Translate to give me answer!
    { decryption: string, key: key, date: date }
  end
end

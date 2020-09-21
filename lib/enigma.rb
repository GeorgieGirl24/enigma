require 'date'

class Enigma
  def find_todays_date
    Date.today.strftime('%d%m%y')
  end

  def find_random_number
    rand(99999).to_s.rjust(5, '0')
  end

  def encrypt(string, key=find_random_number, date=find_todays_date)
    {
      encryption: Translate.encryption(string, key, date)[:string],
      key: Translate.encryption(string, key, date)[:key],
      date: Translate.encryption(string, key, date)[:date]
    }
  end

  def decrypt(string, key=find_random_number, date=find_todays_date)
    {
      decryption: Translate.decryption(string, key, date)[:string],
      key: Translate.decryption(string, key, date)[:key],
      date: Translate.decryption(string, key, date)[:date]
    }
  end
end

require 'date'
require './lib/translate'

class Enigma
  def find_todays_date
    Date.today.strftime('%d%m%y')
  end

  def find_random_number
    rand(99999).to_s.rjust(5, '0')
  end

  def encrypt(string, key=find_random_number, date=find_todays_date)
    hash = { encryption: Translate.encryption(string, key, date)}
    get_together(hash, key, date)
  end

  def decrypt(string, key, date=find_todays_date)
    hash = { decryption: Translate.decryption(string, key, date) }
    get_together(hash, key, date)
  end

  def get_together(hash, key, date)
    hash.merge({:key => key, :date => date})
  end
end

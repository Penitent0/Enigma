# ./encryptor
require './lib/helper_module'

class Encryptor
  include Encryptable
  
  def initialize
    @encrypted = nil
  end

  def encrypt(message, key, date)
    if message.empty? == true 
      return "Message must contain content"
    end
    offset_enumerator = offset_generator(key, date).cycle
    letter_array = message_format(message)
    encrypted_message = ""
    letter_array.each do |letter|
      if alphabet_generator.include?(letter) == false
        encrypted_message << letter
      else
        encrypted_message << alphabet_generator.rotate(alphabet_generator.find_index(letter) + offset_enumerator.next).first
      end
    end
    @encrypted = {encryption: encrypted_message, key: key, date: date}
  end
end

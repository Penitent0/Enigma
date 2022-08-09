# ./decryptor
require './lib/helper_module'

class Decryptor
  include Encryptable
  attr_reader :decrypted

  def initialize
    @decrypted = nil
  end

  def decrypt(message, key, date)
    if message.empty? == true 
      return "Message must contain content"
    end
    offset_enumerator = offset_generator(key, date).cycle
    letter_array = message_format(message)
    decrypted_message = ""
    letter_array.each do |letter|
      if alphabet_generator.include?(letter) == false
        decrypted_message << letter
      else
        decrypted_message << alphabet_generator.rotate(alphabet_generator.find_index(letter) - offset_enumerator.next).first
      end
    end
    @decrypted = {decryption: decrypted_message, key: key, date: date}
  end
end

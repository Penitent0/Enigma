# ./enigma
require './lib/helper_module'

class Enigma
  include Encryptable 
  attr_reader :date,
              :key,
              :encrypted,
              :decrypted

  def initialize
    @encryptor = Encryptor.new
    @date = nil
    @key = nil
    @encrypted = nil
    @decrypted = nil
  end

  def encrypt(message, key = key_generator, date = date_to_string)
    @date = date
    @key = key_helper(key)
    @encryptor.encrypt(message, key_helper(key), date)
  end

  def decrypt(message, key, date = date_to_string)
    @date = date
    @key = key
    if message.empty? == true 
      return "Message must contain content"
    end
    offset_enumerator = offset_generator(key_helper(key), date).cycle
    letter_array = message_format(message)
    decrypted_message = ""
    letter_array.each do |letter|
      if alphabet_generator.include?(letter) == false
        decrypted_message << letter
      else
        decrypted_message << alphabet_generator.rotate(alphabet_generator.find_index(letter) - offset_enumerator.next).first
      end
    end
    @decrypted = {decryption: decrypted_message, key: key_helper(key), date: date}
  end
end
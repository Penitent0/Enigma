# ./encryptor
class Encryptor
  attr_reader :message,
              :key,
              :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @encrypted = nil
  end

  def encrypt
    if @message.empty? == true 
      return "Message must contain content"
    end
    offset_enumerator = offset_generator(key_helper(@key), @date).cycle
    letter_array = message_format(@message)
    encrypted_message = ""
    letter_array.each do |letter|
      if alphabet_generator.include?(letter) == false
        encrypted_message << letter
      else
        encrypted_message << alphabet_generator.rotate(alphabet_generator.find_index(letter) + offset_enumerator.next).first
      end
    end
    @encrypted = {decryption: decrypted_message, key: key_helper(@key), date: @date}
  end
end

# ./enigma
class Enigma
  attr_reader :date

  def initialize
    @date = nil
  end

  def key_generator
    key = []
    5.times { key << rand(0..9).to_s }
    key.join
  end

  def date_to_string
    @date = Time.now.strftime('%d/%m/%y').gsub('/', '')
  end

  def alphabet_generator
    ("a".."z").to_a << " "
  end

  def offset_generator(key, date)
    a_shift = (key[0..1].to_i + (date.to_i ** 2).to_s[-4..-1][0].to_i)
    b_shift = (key[1..2].to_i + (date.to_i ** 2).to_s[-4..-1][1].to_i)
    c_shift = (key[2..3].to_i + (date.to_i ** 2).to_s[-4..-1][2].to_i)
    d_shift = (key[3..4].to_i + (date.to_i ** 2).to_s[-4..-1][3].to_i)
    shifts_array = [a_shift, b_shift, c_shift, d_shift]
  end

  def message_format(message)
    message.downcase.split('')
  end

  def encrypt(message, key = key_generator, date = @date)
    if message.empty? == true 
      return "Message must contain content"
    end 
    offset_enumerator = offset_generator(key_helper(key), date).cycle
    letter_array = message_format(message)
    encrypted_message = ""
    letter_array.each do |letter|
      if alphabet_generator.include?(letter) == false
        encrypted_message << letter
      else
        encrypted_message << alphabet_generator.rotate(alphabet_generator.find_index(letter) + offset_enumerator.next).first
      end
    end
    encryption_hash = {encryption: encrypted_message, key: key_helper(key), date: date}
  end

  def decrypt(message, key, date = @date)
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
    decryption_hash = {decryption: decrypted_message, key: key_helper(key), date: date}
  end

  def key_helper(key)
    key.rjust(5, '0')[0..4]
  end
end
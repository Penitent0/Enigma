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
    @decryptor = Decryptor.new
    @date = nil
    @key = nil
    @encrypted = nil
    @decrypted = nil
  end

  def encrypt(message, key = key_generator, date = date_to_string)
    @date = date
    @key = key_helper(key)
    @encrypted = @encryptor.encrypt(message, key_helper(key), date)
  end

  def decrypt(message, key, date = date_to_string)
    @date = date
    @key = key
    @decrypted = @decryptor.decrypt(message, key, date = date_to_string)
  end
end
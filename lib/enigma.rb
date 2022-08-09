# ./enigma
require './lib/enigma_helper'

class Enigma
  include Enigmable

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

  def encrypt(message, msg_key = key_generator, msg_date = date_to_string)
    @date = msg_date
    @key = key_helper(msg_key)
    @encrypted = @encryptor.encrypt(message, key, date)
  end

  def decrypt(message, msg_key, msg_date = date_to_string)
    @date = msg_date
    @key = key_helper(msg_key)
    @decrypted = @decryptor.decrypt(message, key, date)
  end
end
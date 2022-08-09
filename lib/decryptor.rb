# ./decryptor
require './lib/helper_module'

class Decryptor
include Encryptable

  def initialize
    @decrypted = nil
  end
end

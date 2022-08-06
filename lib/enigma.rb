# ./enigma
class Enigma
  attr_reader :date

  def initialize
    @date = Time.now
  end

  def key_generator
    key = []
    5.times { key << rand(0..9).to_s }
    key.join
  end

  def date_to_string
    @date.strftime('%d/%m/%y').gsub('/', '')
  end
end
# ./enigma
class Enigma
  attr_reader :date

  def initialize
    @date = Time.now
  end

  def date_to_string
    @date.strftime("%D").gsub('/', '')
  end
end
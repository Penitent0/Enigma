module Enigmable
  def key_generator
    key = []
    5.times { key << rand(0..9).to_s }
    key.join
  end

  def key_helper(key)
    key.rjust(5, '0')[0..4]
  end

  def date_to_string
    Time.now.strftime('%d/%m/%y').gsub('/', '')
  end
end
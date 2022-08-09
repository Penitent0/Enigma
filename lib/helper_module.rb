module Encryptable
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

  def alphabet_generator
    ("a".."z").to_a << " "
  end
end
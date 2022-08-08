require './lib/enigma'

if ARGV != ["message.txt", "encrypted.txt"]
  puts "Please enter correct filenames"
  return 
end

enigma = Enigma.new

message_content = File.open(ARGV[0], "r")

enigma.encrypt(message_content.read)

encrypted_content = File.open(ARGV[1], "w")

encrypted_content.write(enigma.encrypted[:encryption])

puts "Created #{File.basename(encrypted_content)} with the key #{enigma.key} and the date #{enigma.date}"

encrypted_content.close

message_content.close

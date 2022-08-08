require './lib/enigma'

enigma = Enigma.new

encrypted_content = File.open(ARGV[0], "r")

enigma.decrypt(encrypted_content.read, ARGV[2], ARGV[3])

decrypted_content = File.open(ARGV[1], "w")

decrypted_content.write(enigma.decrypted[:decryption])

puts "Created #{File.basename(decrypted_content)} with the key #{enigma.key} and the date #{enigma.date}"

encrypted_content.close

decrypted_content.close
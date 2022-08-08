require 'spec_helper'

RSpec.describe Encryptor do 
  context 'when an encryptor is created it' do
    let!(:encryptor) { Encryptor.new("hello world", "02715", "040895") { extend Encryptable } }
    it 'instantiates' do
      expect(encryptor).to be_a(Encryptor)
    end

    it 'extends encryptable key generator' do
      expect(encryptor.key_generator).to be_a(String)
      expect(encryptor.key_generator.length).to eq(5)
      key_sum = encryptor.key_generator.split('').sum { |num| num.to_i }
      expect(key_sum).to be <= 45
      expect(key_sum).to be >= 0
    end

    it 'extends encryptable date to string method' do
      expect(encryptor.date_to_string).to be_a(String)
      expect(encryptor.date_to_string.length).to eq(6)
      expect(encryptor.date_to_string).to eq(Time.now.strftime('%d/%m/%y').gsub('/', ''))
    end

    it 'extends encryptable message format method' do
      expect(encryptor.message_format("hello world")).to be_a(Array)
      expect(encryptor.message_format("hello world")).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
      expect(encryptor.message_format("HELLO WORLD")).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
      expect(encryptor.message_format("test message")).to eq(["t", "e", "s", "t", " ", "m", "e", "s", "s", "a", "g", "e"])
    end

    it 'extends encryptable alphabet generator' do
      expect(encryptor.alphabet_generator).to be_a(Array)
      expect(encryptor.alphabet_generator).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
      expect(encryptor.alphabet_generator.include?("!&?%")).to eq(false)
      expect(encryptor.alphabet_generator.length).to eq(27)
    end

    it 'extends encryptable offset generator method' do
      expect(encryptor.offset_generator("02715", "040895")).to be_a(Array)
      expect(encryptor.offset_generator("02715", "040895")[0]).to eq(3)
      expect(encryptor.offset_generator("02715", "040895")[1]).to eq(27)
      expect(encryptor.offset_generator("02715", "040895")[2]).to eq(73)
      expect(encryptor.offset_generator("02715", "040895")[3]).to eq(20)
    end

    it 'extends encryptable key helper method' do
      expect(encryptor.key_helper("12345")).to be_a(String)
      expect(encryptor.key_helper("1").length).to eq(5)
      expect(encryptor.key_helper("123456")).to eq("12345")
      expect(encryptor.key_helper("1234")).to eq("01234")
      expect(encryptor.key_helper("1")).to eq("00001")
    end

    it 'has details message, key, date' do
      expect(encryptor.message).to eq("hello world")
      expect(encryptor.key).to eq("02715")
      expect(encryptor.date).to eq("040895")
    end

    it 'has encrypt method' do
      expect(encryptor.encrypt).to be_a(Hash)
      expect(encryptor.encrypt).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
    end
  end
end

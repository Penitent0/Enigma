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

    it 'extends encryptable alphabet generator' do
      expect(encryptor.alphabet_generator).to be_a(Array)
      expect(encryptor.alphabet_generator).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
      expect(encryptor.alphabet_generator.include?("!&?%")).to eq(false)
      expect(encryptor.alphabet_generator.length).to eq(27)
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

require 'spec_helper'

RSpec.describe Encryptor do 
  context 'when an encryptor is created it' do
    let!(:encryptor) { Encryptor.new("hello world", "02715", "040895") { extend Encryptable } }
    it 'instantiates' do
      expect(encryptor).to be_a(Encryptor)
    end

    it 'extends encryptable helper module methods' do
      expect(encryptor.key_generator).to be_a(String)
      expect(encryptor.key_generator.length).to eq(5)
      key_sum = encryptor.key_generator.split('').sum { |num| num.to_i }
      expect(key_sum).to be <= 45
      expect(key_sum).to be >= 0
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

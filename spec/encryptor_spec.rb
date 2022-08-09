require 'spec_helper'

RSpec.describe Encryptor do 
  context 'when an encryptor is created it' do
    let!(:encryptor) { Encryptor.new { extend Encryptable } }

    it 'instantiates' do
      expect(encryptor).to be_a(Encryptor)
    end

    it 'has encrypted instance varibale set to nil by default' do
      expect(encryptor.encrypted).to eq(nil)
      encryptor.encrypt("hello world", "02715", "040895")
      expect(encryptor.encrypted).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
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

    it 'has encrypt method' do
      expect(encryptor.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(encryptor.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
      expect(encryptor.encrypt("HELLO WORLD", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
      expect(encryptor.encrypt("hello world!?$", "02715", "040895")).to eq({encryption: "keder ohulw!?$", key: "02715", date: "040895"})
    end
  end
end

require 'spec_helper'

RSpec.describe Decryptor do
  context'when a decryptor is created it' do
    let!(:decryptor) {Decryptor.new { extend Encryptable } }

    it 'instantiates' do
      expect(decryptor).to be_a(Decryptor)
    end

    it 'has decrypted instance variable set to nil by default' do
      expect(decryptor.decrypted).to eq(nil)
      decryptor.decrypt("keder ohulw", "02715", "040895")
      expect(decryptor.decrypted).to eq({decryption: "hello world", key: "02715", date: "040895"})
    end

    it 'extends encryptable alphabet generator' do
      expect(decryptor.alphabet_generator).to be_a(Array)
      expect(decryptor.alphabet_generator).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
      expect(decryptor.alphabet_generator.include?("!&?%")).to eq(false)
      expect(decryptor.alphabet_generator.length).to eq(27)
    end

    it 'extends encryptable offset generator method' do
      expect(decryptor.offset_generator("02715", "040895")).to be_a(Array)
      expect(decryptor.offset_generator("02715", "040895")[0]).to eq(3)
      expect(decryptor.offset_generator("02715", "040895")[1]).to eq(27)
      expect(decryptor.offset_generator("02715", "040895")[2]).to eq(73)
      expect(decryptor.offset_generator("02715", "040895")[3]).to eq(20)
    end

    it 'has decrypt method that takes arguements' do
      expect(decryptor.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
      expect(decryptor.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
      expect(decryptor.decrypt("KEDER OHULW", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
      expect(decryptor.decrypt("keder ohulw!?$", "02715", "040895")).to eq({decryption: "hello world!?$", key: "02715", date: "040895"})
    end
  end
end
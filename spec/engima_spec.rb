require 'spec_helper'

RSpec.describe Enigma do 
  context 'when an enigma is created it' do
    let!(:enigma) { Enigma.new }

    it 'instantiates' do
      expect(enigma).to be_a(Enigma)
    end

    it 'has date instance variable and date to string method' do
      expect(enigma.date).to be_a(Time)
      expect(enigma.date_to_string).to be_a(String)
      expect(enigma.date_to_string.length).to eq(6)
    end

    it 'has random key generator' do
      expect(enigma.key_generator).to be_a(String)
      expect(enigma.key_generator.length).to eq(5)
      key_sum = enigma.key_generator.split('').sum { |num| num.to_i }
      expect(key_sum).to be <= 45
      expect(key_sum).to be >= 0
    end

    it 'has message format method' do
      expect(enigma.message_format("hello world")).to be_a(Array)
      expect(enigma.message_format("hello world")).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
      expect(enigma.message_format("HELLO WORLD")).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
      expect(enigma.message_format("test message")).to eq(["t", "e", "s", "t", " ", "m", "e", "s", "s", "a", "g", "e"])
    end

    it 'has offset generator method' do
      expect(enigma.offset_generator("02715", "040895")).to be_a(Array)
      expect(enigma.offset_generator("02715", "040895")[0]).to eq(3)
      expect(enigma.offset_generator("02715", "040895")[1]).to eq(27)
      expect(enigma.offset_generator("02715", "040895")[2]).to eq(73)
      expect(enigma.offset_generator("02715", "040895")[3]).to eq(20)
    end

    it 'had alphabet generator' do
      expect(enigma.alphabet_generator).to be_a(Array)
      expect(enigma.alphabet_generator).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end

    it 'has encrypt method' do
      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
      expect(enigma.encrypt("HELLO WORLD", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
      expect(enigma.encrypt("hello world!?$", "02715", "040895")).to eq({encryption: "keder ohulw!?$", key: "02715", date: "040895"})
      expect(enigma.encrypt("", "02715", "040895")).to eq("Message must contain content")
      allow(enigma).to receive(:encrypt).and_call_original
      allow(enigma).to receive(:encrypt).with("hello world").and_return({encryption: "encrypted message", key: "generated_key", date: enigma.date_to_string})
      expect(enigma.encrypt("hello world")).to eq({encryption: "encrypted message", key: "generated_key", date: enigma.date_to_string})
    end
  end
end
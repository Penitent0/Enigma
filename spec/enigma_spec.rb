require 'spec_helper'

RSpec.describe Enigma do 
  context 'when an enigma is created it' do
    let!(:enigma) { Enigma.new { extend Enigmable } }

    it 'instantiates' do
      expect(enigma).to be_a(Enigma)
    end

    it 'has date and key instance variables that can be read' do
      expect(enigma.date).to eq(nil)
      expect(enigma.key).to eq(nil)
      enigma.encrypt("testing date and key", "12345", "110555")
      expect(enigma.date).to eq("110555")
      expect(enigma.key).to eq("12345")
      enigma.decrypt("testing key with decrypt method", "54321")
      expect(enigma.key).to eq("54321")
    end

    it 'has encrypted and decrypted instance variables' do
      expect(enigma.encrypted).to eq(nil)
      expect(enigma.decrypted).to eq(nil)
      enigma.encrypt("hello world", "02715", "040895")
      enigma.decrypt("keder ohulw", "02715", "040895")
      expect(enigma.encrypted).to be_a(Hash)
      expect(enigma.decrypted).to be_a(Hash)
      expect(enigma.encrypted).to eq({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
      expect(enigma.decrypted).to eq({:date=>"040895", :decryption=>"hello world", :key=>"02715"})
    end

    it 'has encrypt method' do
      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
      expect(enigma.encrypt("HELLO WORLD", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
      expect(enigma.encrypt("hello world!?$", "02715", "040895")).to eq({encryption: "keder ohulw!?$", key: "02715", date: "040895"})
      expect(enigma.encrypt("hello world", "1", "040895")).to eq({encryption: "ienrp yuslf", key: "00001", date: "040895"})
      expect(enigma.encrypt("hello world", "123456", "040895")).to eq({encryption: "uauhawekdhm", key: "12345", date: "040895"})
      expect(enigma.encrypt("", "02715", "040895")).to eq("Message must contain content")
      allow(enigma).to receive(:encrypt).and_call_original
      allow(enigma).to receive(:encrypt).with("hello world").and_return({encryption: "encrypted message", key: "generated_key", date: enigma.date_to_string})
      expect(enigma.encrypt("hello world")).to eq({encryption: "encrypted message", key: "generated_key", date: enigma.date_to_string})
    end

    it 'has decrypt method' do 
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
      expect(enigma.decrypt("KEDER OHULW", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
      expect(enigma.decrypt("keder ohulw!?$", "02715", "040895")).to eq({decryption: "hello world!?$", key: "02715", date: "040895"})
      expect(enigma.decrypt("keder ohulw", "0271512345", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
      allow(enigma).to receive(:decrypt).and_call_original
      allow(enigma).to receive(:decrypt).with("keder ohulw", "02715").and_return({decryption: "decrypted message", key: "02715", date: enigma.date_to_string})
      expect(enigma.decrypt("keder ohulw", "02715")).to eq({decryption: "decrypted message", key: "02715", date: enigma.date_to_string})
    end
  end
end
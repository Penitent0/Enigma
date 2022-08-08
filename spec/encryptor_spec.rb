require 'spec_helper'

RSpec.describe Encryptor do 
  context 'when an encryptor is created it' do
    let!(:encryptor) {Encryptor.new("hello world", "02715", "040895")}
    it 'instantiates' do
      expect(encryptor).to be_a(Encryptor)
    end

    it 'has details message, key, date' do
      expect(encryptor.message).to eq("hello world")
      expect(encryptor.key).to eq("02715")
      expect(encryptor.date).to eq("040895")
    end
  end
end
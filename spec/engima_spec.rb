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
  end
end
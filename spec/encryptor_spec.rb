require 'spec_helper'

RSpec.describe Encryptor do 
  context 'when an encryptor is created it' do
    let!(:encryptor) {Encryptor.new}
    it 'instantiates' do
      expect(encryptor).to be_a(Encryptor)
    end
  end
end
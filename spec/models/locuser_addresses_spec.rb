require 'spec_helper'

describe Locuser do
  it 'can create an AddressedLocation object' do
    expect { Locuser::AddressedLocation.new }.not_to raise_error
  end

  context 'address access' do
    before (:context) do
      @addr = build(:locuser_addressed_location)
    end

    it 'allows getting of non-existant address components without exception' do
      expect { @addr.address(:foo) }.not_to raise_error
      expect(@addr.address(:foo)).to eq(nil)
    end

    it 'allows setting of address components' do
      expect { @addr.state = 'Idaho' }.not_to raise_error
      expect(@addr.state).to eq('Idaho')
    end

    it 'allows access to the address' do
      expect { @addr.full_address }.not_to raise_error
    end

    it 'allows setting of address components' do
      expect { @addr.set_address(:state, 'Idaho') }.not_to raise_error
      expect(@addr.address(:state)).to eq('Idaho')
      expect(@addr.state).to eq('Idaho')
    end
  end

  context 'address formatting' do

    it 'formats an empty address approrpriately without error' do
    end

  end

end

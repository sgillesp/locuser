require 'spec_helper'

describe Locuser do
  it 'can create an AddressedLocation object' do
    expect { Locuser::AddressedLocation.new }.not_to raise_error
  end

  context 'street address access' do
    before (:each) do
      @addr = build(:locuser_addressed_location)
    end

    it 'allows getting of non-existant address components without exception' do
      expect { @addr.address(:foo) }.not_to raise_error
      expect(@addr.address(:foo)).to eq(nil)
    end

    it 'allows setting of address components' do
      expect { @addr.state = 'Idaho' }.not_to raise_error
      expect(@addr.state).to eq('Idaho')
      expect(@addr.address).to eq('Idaho')
    end

    it 'allows access to the address' do
      expect { @addr.address }.not_to raise_error
    end

    it 'allows setting of address components' do
      expect { @addr.set_address('Idaho', :state) }.not_to raise_error
      expect(@addr.address(:state)).to eq('Idaho')
      expect(@addr.state).to eq('Idaho')
    end
  end

  context 'owner street address' do
    before (:each) do
      @addr = build(:locuser_owner_addressed_location)
    end

    it 'allows getting of non-existant address components without exception' do
      expect { @addr.address(:foo) }.not_to raise_error
      expect(@addr.address(:foo)).to eq(nil)
    end

    it 'allows setting of address components' do
      expect { @addr.state = 'Idaho' }.not_to raise_error
      expect(@addr.state).to eq('Idaho')
      expect(@addr.address).to eq('Idaho')
    end

    it 'allows access to the address' do
      expect { @addr.address }.not_to raise_error
    end

    it 'allows setting of address components' do
      expect { @addr.set_address('Idaho', :state) }.not_to raise_error
      expect(@addr.address(:state)).to eq('Idaho')
      expect(@addr.state).to eq('Idaho')
    end
  end

  context 'parsing addresses' do
    before (:each) do
      @addr = build("UW Medical Center")
      @addr.address = "1959 NE Pacific Avenue, Seattle, WA 98195"
    end

    it 'appropriately parsed street' do
      expect(@addr.street1).to eq('1959 NE Pacific Ave')
    end

    it 'appropriately parsed city' do
      expect(@addr.city).to eq('Seattle')
    end

    it 'appropriately parsed street' do
      expect(@addr.state).to eq('WA')
    end

    it 'appropriately parsed street' do
      expect(@addr.zip).to eq('98195')
    end

    it 'appropriately parsed street' do
      expect(@addr.address).to eq("1959 NE Pacific Ave Seattle, WA  98195")
    end

  end

  context 'address formatting' do

    it 'formats an empty address approrpriately without error' do
    end

  end

end

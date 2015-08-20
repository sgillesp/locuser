require 'spec_helper'

describe Locuser do

  it 'can create an AddressedLocation object' do
    expect { Locuser::TestHashedAddress.new }.not_to raise_error
  end

  context 'parsing addresses' do
    let(:addr) { build(:uwmc) }

    it 'appropriately parsed street' do
      expect(addr[:street]).to eq('Pacific')
    end

    it 'appropriately parsed city' do
      expect(addr[:city]).to eq('Seattle')
    end

    it 'appropriately parsed state' do
      expect(addr[:state]).to eq('WA')
    end

    it 'appropriately parsed postal_code' do
      expect(addr[:postal_code]).to eq('98195')
    end

    it 'appropriately parsed address' do
      expect(addr.to_s).to eq("1959 NE Pacific Ave, Seattle, WA 98195")
    end

  end

  # context 'address formatting' do
  #
  #   it 'formats an empty address approrpriately without error' do
  #   end
  #
  # end

  shared_examples "an address" do

    it 'allows creation of an empty address' do
      expect(addr.nil?).not_to eq(true)
    end

    it 'allows access to the address storage' do
      expect { addr }.not_to raise_error
    end

    it 'allows getting of non-existant address components without exception, returning nil' do
      expect { addr[:foo] }.not_to raise_error
    end

    it 'allows setting of appropriate address components' do
      expect { addr[:street] = 'street' }.not_to raise_error
      expect { addr[:city] = 'city' }.not_to raise_error
      expect { addr[:state] = 'state' }.not_to raise_error
      expect { addr[:postal_code] = 'postal_code' }.not_to raise_error
      expect(addr[:street]).to eq('street')
      expect(addr[:city]).to eq('city')
      expect(addr[:state]).to eq('state')
      expect(addr[:postal_code]).to eq('postal_code')
    end

  end # Rspec.shared_examples

  describe Locuser::HashedAddress do
    it_behaves_like "an address" do
      let (:addr) { create(:hashed_address) }
    end
  end

  describe Locuser::OwnerStreetAddress do
    it_behaves_like "an address" do
      let (:addr) { create(:owned_address) }
    end
  end

end

require 'spec_helper'
require 'street_address'

describe Locuser do
  before(:context) do
    Locuser.config.parser_class = ::StreetAddress::US
  end

  after(:context) do
    Locuser.config.parser_class = nil
  end

  context 'parsing addresses with StreetAddress gem' do
    let(:addr) { Locuser.config.parser_class = ::StreetAddress::US; build(:uwmc) }

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

    it 'appropriately parsed and prints address using StreetAddress::US' do
      expect(addr.address).to eq("1959 NE Pacific Ave, Seattle, WA 98195")
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

    it 'allows explicit creation of the entity-node relationship' do
      a = Locuser::TestAddressOwner.new
      a.taxonomy_node = Locuser::TestOwnerAddress.new
      expect(a.taxonomy_node).not_to eq(nil)
      expect(a.taxonomy_node.owner).to eq(a)
    end
  end


end

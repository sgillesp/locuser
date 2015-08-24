
require 'faker'
require 'factory_girl'

FactoryGirl.define do

  factory :locuser_location, :class => 'Locuser::Location' do
    name "Home"
  end

  factory :address_owner, :class => 'Locuser::TestAddressOwner' do
  end

  factory :owned_address, :class => 'Locuser::TestOwnerAddress'  do
    association :owner, factory: :address_owner, strategy: :build
  end

  factory :hashed_address, :class => 'Locuser::TestHashedAddress' do
  end

  factory :random_hashed_address, :parent => :hashed_address do
    name Faker::Company.name
    after(:build) { |a| a.address = Locuser::SpecSeedData.addresses.shift }
  end

  factory :uwmc, :parent => :hashed_address do
    name "University of Washington Medical Center"
    after(:build) { |a| a.address = "1959 NE Pacific Avenue, Seattle, WA 98195" }
  end

  factory :uwmc_hashed, :parent => :hashed_address do
    name "University of Washington Medical Center"
    after(:build) { |a| a.address_hash = { :street => '1959 NE Pacific Ave', :city => 'Seattle', :state => 'WA', :postal_code => '98195' } }
  end

end


require 'faker'

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

  # factory :locuser_address, :class => 'Locuser::TestStreetAddress' do
  #
  #   trait :owned do
  #     association :address_obj, factory: :owned_address
  #   end
  #
  #   trait :hashed do
  #     # association :address_obj, factory: :hashed_address
  #     # address_obj { FactoryGirl.build(:hashed_address) }
  #   end
  #
  # end

  factory :uwmc, :parent => :hashed_address do
    name "University of Washington Medical Center"
    after(:build) { |a| a.address = "1959 NE Pacific Avenue, Seattle, WA 98195" }
  end

  factory "Harborview Medical Center", parent: :hashed_address do
    name "Harborview Medical Center"
    after(:build) { |a| a.address = "325 9th Ave, Seattle, WA 98104" }
  end

  factory "Swedish Medical Center", parent: :hashed_address do
    name "Swedish Medical Center"
    after(:build) { |a| a.address = "5300 Tallman Ave NW, Seattle, WA 98107" }
  end

end


require 'faker'

FactoryGirl.define do
  factory :locuser_location, :class => 'Locuser::Location' do
    name "Home"
  end

  factory :locuser_addressed_location, :class => 'Locuser::TestStreetAddress' do
    name "Home"
  end

  factory :locuser_owner_addressed_location, :class => 'Locuser::TestOwnerAddress' do
    owner Locuser::TestAddressOwner.new
    name "Home"
  end

  factory "UW Medical Center", :class => 'Locuser::TestStreetAddress' do
    name "University of Washington Medical Center"
  end

end

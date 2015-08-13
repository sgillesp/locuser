
require 'faker'

FactoryGirl.define do
  factory :locuser_location, :class => 'Locuser::Location' do
    name "Home"
    description "Home sweet home."
  end

  factory :locuser_addressed_location, :class => 'Locuser::AddressedLocation' do
    name "Home"
    description "Home sweet home."
  end

end


require 'faker'

FactoryGirl.define do
  factory :locuser_locality, :class => 'Locuser::Locality' do
    name "Seattle"
    description "The emerald city."
  end

  factory :random_city_generator, :class => 'Locuser::City' do
    name { Faker::Address.city }
    description { Faker::Lorem.paragraph }
  end

  factory :random_state_generator, :class => 'Locuser::State' do
    name { Faker::Address.state }
    description { Faker::Lorem.paragraph }
  end

  factory :random_county_generator, :class => 'Locuser::County' do
    name { Faker::Name.last_name }
    description { Faker::Lorem.paragraph }
  end

  factory :random_country_generator, :class => 'Locuser::Country' do
    name { Faker::Address.country }
    description { Faker::Lorem.paragraph }
  end

  # note that this creates a Place object, not a specific city, state, etc..
  factory :random_place_generator, :class => 'Locuser::Locality' do
    name { Faker::Address.city }
    description { Faker::Lorem.paragraph }

    trait :city do
        factory :random_city_generator
        name { Faker::Address.city }
    end

    trait :state do
        factory :random_state_generator
        name { Faker::Address.state }
    end

    trait :county do
        factory :random_county_generator
        name { Faker::Name.last_name }
    end

    trait :country do
        factory :random_country_generator
        name 'United States'
    end
  end

end

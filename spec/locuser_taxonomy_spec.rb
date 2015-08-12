require 'spec_helper'

describe Locuser do

  it 'allows state within country' do
    country = FactoryGirl.build(:random_country_generator)
    state = FactoryGirl.build(:random_state_generator)
    expect { country.children << state }.not_to raise_error
  end

  it 'allows county within state' do
    county = FactoryGirl.build(:random_country_generator)
    state = FactoryGirl.build(:random_state_generator)
    expect { state.children << county }.not_to raise_error
  end

  it 'allows city within county' do
    county = FactoryGirl.build(:random_county_generator)
    city = FactoryGirl.build(:random_city_generator)
    expect { county.children << city }.not_to raise_error
  end

  it 'allows city within country' do
    country = FactoryGirl.build(:random_country_generator)
    city = FactoryGirl.build(:random_city_generator)
    expect { country.children << city }.not_to raise_error
  end

  it 'disallows country within state' do
    country = FactoryGirl.build(:random_country_generator)
    state = FactoryGirl.build(:random_state_generator)
    expect { state.children << country }.not_to raise_error
  end

  it 'disallows state within city' do
    city = FactoryGirl.build(:random_city_generator)
    state = FactoryGirl.build(:random_state_generator)
    expect { city.children << state }.not_to raise_error
  end

end

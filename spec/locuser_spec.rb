require 'spec_helper'

describe Locuser do
  it 'has a version number' do
    expect(Locuser::VERSION).not_to be nil
  end

  it 'allows creation of all classes' do
    expect { city = build(:random_city_generator) }.not_to raise_error
    expect(city).not_to eq(nil)
    expect { county = build(:random_county_generator) }.not_to raise_error
    expect(county).not_to eq(nil)
    expect { state = build(:random_state) }.not_to raise_error
    expect(state).not_to eq(nil)
    expect { country = build(:random_country_generator) }.not_to raise_error
    expect(country).not_to eq(nil)
  end

  it 'allows destruction of all classes' do
    expect { build(:random_city_generator).destroy }.not_to raise_error
    expect { build(:random_county_generator).destroy }.not_to raise_error
    expect { build(:random_state).destroy }.not_to raise_error
    expect { build(:random_country_generator).destroy }.not_to raise_error
  end
  
end

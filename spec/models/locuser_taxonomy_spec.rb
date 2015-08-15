require 'spec_helper'
require 'taxonomite/taxonomy'

describe Locuser do
  before :context do
    @taxonomy = FactoryGirl.build(:taxonomy_generator)
  end

  context 'enforcing taxonomy' do
      before :each do
        @country = FactoryGirl.build(:random_country_generator)
        @state = FactoryGirl.build(:random_state_generator)
        @county = FactoryGirl.build(:random_county_generator)
        @city = FactoryGirl.build(:random_city_generator)
      end

      it 'allows state within country' do
        expect { @taxonomy.add(@country, @state) }.not_to raise_error
      end

      it 'allows county within state' do
        expect { @taxonomy.add(@state, @county) }.not_to raise_error
      end

      it 'allows city within county' do
        expect { @taxonomy.add(@county, @city) }.not_to raise_error
      end

      it 'allows city within country' do
        expect { @taxonomy.add(@country, @city) }.not_to raise_error
      end

      it 'disallows country within state' do
        expect { @taxonomy.add(@state, @country) }.to raise_error
      end

      it 'disallows state within city' do
        expect { @taxonomy.add(@city, @state) }.to raise_error
      end
  end

end

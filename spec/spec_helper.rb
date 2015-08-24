ENV['RAILS_ENV'] ||= 'test'
ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

#require File.expand_path("../../spec/test_app/config/environment", __FILE__)
require "#{ENGINE_RAILS_ROOT}/spec/test_app/config/environment"
require 'rspec/rails'
require 'factory_girl'
require 'byebug'
require 'locuser_helper'
require 'street_address'

Rails.backtrace_cleaner.remove_silencers!

# this loads support classes
Dir[File.join(ENGINE_RAILS_ROOT, 'spec/support/**/*.rb')].each {|f| require f}

# this loads the model for specs
Dir[File.join(ENGINE_RAILS_ROOT, 'spec/models/locuser/*.rb')].each {|f| require f}

# this will cause factories to load twice!!
Dir[File.join(ENGINE_RAILS_ROOT, "spec/factories/**/*.rb")].each {|f| require f}

# load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
    config.mock_with :rspec
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.infer_spec_type_from_file_location!
    config.include FactoryGirl::Syntax::Methods
    RSpec::Expectations.configuration.warn_about_potential_false_positives = false
end

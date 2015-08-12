ENV['RAILS_ENV'] ||= 'test'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rails/all'
require 'rspec/rails'
require 'factory_girl_rails'
require 'locuser'

Rails.backtrace_cleaner.remove_silencers!

# load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
    config.mock_with :rspec
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.infer_spec_type_from_file_location!

    config.include FactoryGirl::Syntax::Methods
    RSpec::Expectations.configuration.warn_about_potential_false_positives = true
end

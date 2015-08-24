require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "locuser"
require 'street_address'

# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../../..') if (ENGINE_RAILS_ROOT.nil?)

# make sure this comes before requiring these files
Locuser.configure do |c|
    c.use_geocoder = false
end

# this loads support classes
Dir[File.join(ENGINE_RAILS_ROOT, 'spec/support/**/*.rb')].each {|f| require f}

# this loads the model for specs
Dir[File.join(ENGINE_RAILS_ROOT, 'spec/models/locuser/*.rb')].each {|f| require f}

# this will cause factories to load twice!!
Dir[File.join(ENGINE_RAILS_ROOT, "spec/factories/**/*.rb")].each {|f| require f}

module TestApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end


Dir[File.join(ENGINE_RAILS_ROOT, 'lib/**/*.rb')].each {|f| require f}

Locuser::Configuration.config do |config|
    config.use_geocoder = false
end

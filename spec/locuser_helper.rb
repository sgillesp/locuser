
Dir[File.join(ENGINE_RAILS_ROOT, 'lib/**/*.rb')].each {|f| require f}

Locuser::Configuration.configure do |config|
    config.use_geocoder = false
    config.parser_class = "StreetAddress::US" # this uses the StreetAddress gem
end

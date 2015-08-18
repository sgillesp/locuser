
Dir[File.join(ENGINE_RAILS_ROOT, 'lib/**/*.rb')].each {|f| require f}

Locuser.configure do |c|
    c.use_geocoder = false
    c.parser_class = "StreetAddress::US" # this uses the StreetAddress gem
end

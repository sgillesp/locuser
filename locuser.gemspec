# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'locuser/version'

Gem::Specification.new do |spec|
  spec.name          = "locuser"
  spec.version       = Locuser::VERSION
  spec.authors       = ["sgillesp"]
  spec.email         = ["masterofratios@gmail.com"]

  spec.summary       = %q{Provides localization within a taxonomy, along with true geospatial localization as well.}
  spec.description   = %q{This gem enforces a taxonomy (using Taxonomite) based upon places (i.e. states, countries, counties, cities, etc.). It also provides geolocation at the leaves of the hierarchy (Locations) which can be specified via geolocation coordinates and/or a street address. }
  spec.homepage      = "http://github.com/sgillesp/locuser"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|app)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", '~> 4.0', '>= 4.0'
  spec.add_dependency "mongodb"
  spec.add_dependency "moped"
  spec.add_dependency "mongoid"
  spec.add_dependency "bson_ext"
  spec.add_dependency "taxonomite", ">= 0.1.0"
  spec.add_dependency "geocoder"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails", "~> 3.2"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "factory_girl_rails"
  spec.add_development_dependency "better_errors"
  spec.add_development_dependency "binding_of_caller"
end

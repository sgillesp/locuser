# taxonomite_configuration.rb
#   hold configuration parameters for the library
#

module Locuser
    class Configuration
        attr_accessor   :use_geocoder
        attr_accessor   :google_api_key

        # Class declarations
        #
        # configuration
        #
        # !! note that configuration is class-wide, rather than on an
        #    instance-instance value; this could be changed, for example if
        #    two simultaneous persistence models for the place were desired
        #
        class << self
            attr_writer :configiration
        end

        def self.config
            @configuration ||= Locuser::Configuration.new
        end

        def self.configure
            yield(config)
        end

        def self.reset
            @configuration = Locuser::Configuration.new
        end

    protected
        # initialize
        def initialize
          @use_geocoder = :true
          @google_api_key = 'AIzaSyDR-WjFAX-6lYkLBparpdxrXiFsHet-DQY'
        end
    end
end

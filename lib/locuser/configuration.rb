# taxonomite_configuration.rb
#   hold configuration parameters for the library
#

require "locuser/address_formatter"

module Locuser
    ##
    # Handles configuration for the Locuser library. Various configuration options
    # are described below. In general, the configuration options should be set
    # before any source files from the ruby library are loaded as several classes
    # depend upon these options to determine which modules to include.
    class Configuration
        attr_accessor   :use_geocoder
        attr_accessor   :google_api_key
        attr_accessor   :address_formatter
        attr_accessor   :parser
        attr_accessor   :parser_class

        ##
        # Access the parser object, if it is nil then try to create it. If @parser_class is not valid or empty
        # then this will return nil. A good reference for a parser would be the gem StreetAddress.
        # @return [ParserObject]
        def parser
          @parser ||= (@parser_class.nil? || @parser_class.empty?) ? nil : Object.const_get(@parser_class).new
        end

    protected
        # initialize
        def initialize
          @use_geocoder = :true
          @google_api_key = 'AIzaSyDR-WjFAX-6lYkLBparpdxrXiFsHet-DQY'
          @address_formatter = Locuser::AddressFormatter.new
          @parser_class = nil
        end
    end
end

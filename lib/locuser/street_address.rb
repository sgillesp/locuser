# locuser/streetaddress.rb

require 'locuser/location'

module Locuser
  ##
  # Class to handle street addresses as a Locuser::Location object.
  # Handles all of the ins/outs of managing an address and parses it using a
  # separate class. The class to parse (as Klass::parse(String)) is set in the
  # Locuser configuration class as parser_class, which should be a class that
  # responds to parse returning an Object that can provide the address components
  # as a hash of key/value pairs. The actual storage of the address hash must
  # be done by subclasses. Code for actually handling the street address
  # manipulation, localization (geolocation), and taxonomic representaitons are
  # kept separate and bridge together through this class.
  class StreetAddress < Locuser::Location

    ##
    # Provides access to the street address as a string. This is necesary in order to
    # perform geocoding using the geocoder gem (from Locuser::Location, if enabled).
    # @return [String] the address as a single line string
    def address
      self.to_s
    end

    ##
    # Allows setting of the address record from a string (calls from_s).
    # @param [String] s the string containing the address info
    # @return [StreetAddress] this object (self)
    def address=(s)
      self.from_s(s)
    end

    ##
    # set the address to a string, which will try to parse the address
    # using the default parser via Locuser::Configuration. If this is
    # not available does nothing. !!! Could have this throw exception in
    # the future.
    # @param [String] s the address to set to
    # @return [String] address component, or nil if not present
    def from_s(s)
      self.from_h(Locuser.config.address_formatter.s_to_h(s))
      # unless (Locuser.config.parser_class.nil? || !Locuser.config.parser_class.respond_to?(:parse))
      #   a = Locuser.config.parser_class.send(:parse, s)
      #   self.from_h(a.to_h) unless a.nil?
      # end
    end

    ##
    # get a particular address component. Generally :street1, :street2,
    # :city, :state, :zip, :country are supported. This method will return
    # the address as one line if h1 is nil. This is needed to support geocoder
    # geolocation encoding (geocoder will call address, expecting a street address)
    # @param [Hash] key the component to find
    # @return [String] address component, or nil if not present
    def to_s
      Locuser.config.address_formatter.h_to_s(self.to_h)
    end

    ##
    # Set a particular address component. The base class method does nothing.
    # @param [Hash] key the component to set
    # @param [String] val the value to set to
    # @return [String] address component, or nil if not present
    def []=(key,val)
      val
    end

    ##
    # Get the value of a particular address component. The base class method returns nil.
    # @param [Hash] key the component to set
    # @param [String] val the value to set to
    # @return [String] address component, or nil if not present
    def [](key)
      nil # should return "" if non-existant ?? !!! Exception handling here
    end

    ##
    # Return the address components as a Hash. Base class returns {}
    # @return [Hash] a hash of the address components
    def to_h
      {}  # should return nil? ??
    end

    # Return the address components as a Hash. Base class returns {}
    def from_h(h)
      {}  # should return nil? ??
    end

  end   # class StreetAddress
end # module Locuser

# locuser/streetaddress.rb

require 'locuser/location'

module Locuser
  ##
  # Class to handle street addresses - this is not necessarily stored as a
  # part of a Mongoid document, but rather handles all of the ins/outs of
  # managing an address and validates it against a directory service, if desired.
  # Code for actually handling the street address manipulation, etc. is separate,
  # therefore, from the localized (geolocated) address and taxonomic representation.
  class StreetAddress < Locuser::Location
    # extend ActiveSupport::Concern
    #
    # included do
    #   # only allow subclass access to the address_hash
    #   # embedded_in :addressable, polymorphic: true
    # end

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

    ##
    # try to determine the address from the owner and create our hash. for
    # now this is a temporary fix, but should be passed to another class or
    # module in the near future. This is bad as it duplicates the address info,
    # wasting storage (minor) but also requiring mainteance to keep synchronized
    # (major).
    # def do_initialize
    # end

  end   # class StreetAddress
end # module Locuser

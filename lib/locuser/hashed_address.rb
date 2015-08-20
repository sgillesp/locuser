# locuser/streetaddress.rb

require 'active_support/concern'
require 'locuser/streetaddress'

module Locuser
  ##
  # Class to handle street addresses - this is not necessarily stored as a
  # part of a Mongoid document, but rather handles all of the ins/outs of
  # managing an address and validates it against a directory service, if desired.
  # Code for actually handling the street address manipulation, etc. is separate,
  # therefore, from the localized (geolocated) address and taxonomic representation.
  module HashedAddress
    extend ActiveSupport::Concern

    included do
      include Locuser::StreetAddress

      # this is the actual address hash
      field :address_hash, type: Hash, default: {}
    end

    ##
    # get a particular address component. Generally :street1, :street2,
    # :city, :state, :zip, :country are supported. This method will return
    # the address as one line if h1 is nil. This is needed to support geocoder
    # geolocation encoding (geocoder will call address, expecting a street address)
    # @param [Hash] key the component to find
    # @return [String] address component, or nil if not present
    def [](key)
      self.address_hash[key]
    end

    ##
    # set a particular address component. Generally :street1, :street2,
    # :city, :state, :zip, :country are supported. If h is nil, nothing is
    # set for this class -- need to specify the hash to call this method for
    # this particular class.
    # @param [Hash] key the component to set
    # @param [String] val the value to set to
    # @return [String] address component, or nil if not present
    def []=(key, val)
      self.address_hash[key] = val unless key.nil?
    end

    ##
    # set the address values from a hash. For this class this is just a copy
    # @param [Hash] h the hash to set to
    # @return [HashAddress] returns this object (self)
    def from_h(h)
      self.address_hash = h
    end

    ##
    # access the values for this address object as a hash. Just returns the address
    # hash
    # @return [Hash] the address as a hash b
    def to_h
      address_hash
    end

  end   # class StreetAddress
end # module Places

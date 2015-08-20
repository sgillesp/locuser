# locuser/streetaddress.rb

require 'active_support/concern'

module Locuser
  ##
  # Class to handle street addresses by passing all calls through to the owner
  # object. In the future it may be worthwhile to use caching to store an address
  # string in this object, then simply check if the owner has changed whenever
  # address is involved, forcing a geolocation update at that time as well.
  module OwnerStreetAddress
    extend ActiveSupport::Concern

    included do
      include Locuser::StreetAddress

    end

    ##
    # Get a particular address component. Calls its 'owner' with the key for the value.
    # The owner object must respond_to? :key, otherwise returns nil
    # @param [Hash] key the component to find
    # @return [String] address component, or nil if not present
    def [](key)
      self.owner.send(key) unless (self.owner.nil? || !self.owner.respond_to?(key)) # will allow for exceptions if key not defined
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
      mthd = key.to_s + '='
      self.owner.send(mthd, val) unless (self.owner.nil? || !self.owner.respond_to?(mthd))
    end

    ##
    # set the values for this object from a hash of key value pairs
    # this will call set (key,value) for everything in the has via the
    # owner object, which will handle errors on its own if a method is
    # not defined.
    # @param [Hash] h the has to convert to an address object
    def from_h(h)
      h.each { |key, value| self.set(key,value) } unless self.owner.nil?
    end

    ##
    # return the value of all of these values as
    def to_h
      { :street => self.address(:street),
        :city => self.address(:city),
        :state => self.address(:state),
        :postal_code => self.address(:postal_code) }
    end

  end   # class OwnerStreetAddress
end # module Places

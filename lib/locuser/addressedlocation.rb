# locuser/addresssedlocation.rb

require 'active_support/concern'
require 'locuser/location'
#require 'locuser/streetaddress'

module Locuser
  ##
  # Class which encloses a Locuser::StreetAddress and pulls it into persistent
  # storage, as well as wrapping geolocation to the address
  # (from Locuser::Location superclass). Thus both the address and the geolocation
  # are stored. This is the most appropriate class to associate with an outside
  # (non-taxonomized) entity (like a user, business, etc...).
  module AddressedLocation
    extend ActiveSupport::Concern

    included do
      # the address object which stores the address information
      embeds_one  :address_obj, as: :addressable

      class_eval "def base_class; ::#{self.name}; end"
    end

    ##
    # Access the address storage object for this instance. By definition
    # the address_obj is expected to respond to get/set via [key] and [key]=
    # as well as to_h, and from_h methods.
    # @return [Object] address storage object
    def address
      self.address_obj
    end

    # ##
    # # Assign the address to a string indicative of the entire address. Overwrites
    # # any pre-existing address information. For now addresses must be US addresses.
    # # Does range checking such that will not assign, but will not throw exception
    # # if address object storage is non-existent.
    # # @param [String] s the string containing the address
    # # @return [AddressableLocation] returns self
    # def address=(s)
    #   self.address_obj.from_s(s) unless self.address_obj.nil?
    # end

    ##
    # Access the address storage object for this instance. By definition
    # the address_obj is expected to respond to get/set via [key] and [key]=
    # as well as to_s, to_h, and from_h methods.
    # @param [Object] address storage object
    # @return [Object] returns the storage object just set
    def address=(obj)
      self.address_obj = obj
    end

  end   # class AddressedLocation
end # module Places

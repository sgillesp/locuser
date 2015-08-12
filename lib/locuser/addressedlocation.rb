# locuser/addresssedlocation.rb

require 'locuser/location'
require 'locuser/streetaddress'

module Locuser
  ##
  # Class which encloses a Locuser::StreetAddress and pulls it into persistent
  # storage, as well as wrapping geolocation to the address
  # (from Locuser::Location superclass). Thus both the address and the geolocation
  # are stored. This is the most appropriate class to associate with an outside
  # (non-taxonomized) entity (like a user, business, etc...)
  class AddressedLocation < Locuser::Location
    include Locuser::StreetAddress

    protected
    ##
    # Return the entity type; for taxonomy hierarchy
    # @return [String] this entity type
    def get_entity_type
        'street_address'
    end

    ##
    # Valid parent types to support taxonomy hierarchy.  Addressed location
    # can live anywhere. Really should be within another addressed location, but
    # this is not enforced.
    # @return [String] valid parent
    def valid_parent_types
      '*'
    end

  end   # class AddressedLocation
end # module Places

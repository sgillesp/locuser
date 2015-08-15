
require 'locuser/locality'

module Locuser
  class State < ::Locuser::Locality
    include Locuser::SpecBase

    field   :capitol, type: String, default: "Olympia"

    ##
    # Determines whether a location lies within the locality (state).
    # Assumes that the location state is stored in the same format as this class
    # will store it (i.e. CO vs. Colorado).
    # @param [Locuser::StreetAddress, #read] loc location (street address for now)
    # @return [boolean] whether the location lies within the country
    def contains?(loc)
      return loc.state == self.name
    end

    protected
    ##
    # Return the entity type (state); for taxonomy hierarchy
    # @return [String] this entity type (state)
    def get_entity_type
        return 'state'
    end

    ##
    # Valid parent types to support taxonomy hierarchy.
    # @return [String] valid parent
    def valid_parent_types
      'country'
    end

  end   # class State
end # module Places

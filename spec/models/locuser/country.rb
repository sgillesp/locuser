
module Locuser
  ##
  # Represents a country as a Locality. Has no particular location. Can accept
  # States, and Locations as children.
  class Country < Locuser::Locality
    include Locuser::SpecBase

    ##
    # Determines whether a location lies within the country.
    # @param [Locuser::StreetAddress, #read] loc location (street address for now)
    # @return [boolean] whether the location lies within the country
    def contains?(loc)
      return loc.country == self.name
    end

    protected

    ##
    # Return the entity type (country); for taxonomy hierarchy
    # @return [String] this entity type (country)
    def get_entity_type
        'country'
    end

    ##
    # Valid parent types (planet is a bit of a joke); engine doesn't currently
    # support anything greater than country.
    # @return [String] valid parent (planet)
    def valid_parent_types
      'planet'
    end

  end   # class Country
end # module Places

# city.rb

module Locuser
  class City < Locuser::Locality
    include Locuser::SpecBase

    ##
    # Determines whether a location lies within the city.
    # @param [Locuser::StreetAddress, #read] loc location (street address for now)
    # @return [boolean] whether the location lies within the city
    def contains?(loc)
      return loc.city == self.name
    end

    protected
    ##
    # Return the entity type (city); for taxonomy hierarchy
    # @return [String] this entity type (citys)
    def get_entity_type
        'city'
    end

  end   # class State
end # module Places

require 'taxonomite/node'
require 'geocoder'

module Locuser
  ##
  # A locality represents a node which has no exact physical address (though may
  # cover an area or region). Examples would include states, counties, and cities.
  # This class allows for positioning in a taxonomy hierarchy. Future versions
  # will allow determination of locaitons within the region, etc... 
  class Locality < Taxonomite::Node

    field :includetypeinname, type: Boolean, default: false

    def self.primary_key
      "_id"
    end

    ##
    # typeify name w entity (i.e. 'Washington state' vs. 'Seattle'). behavior
    # is modified by the includetypeinname field.
    # @return [String] the typeified name of the locality
    def typeifiedname
      s = self.name
      s += (" " + self.entity_type.capitalize) if self.includetypeinname
      return s
    end

    ##
    # does this locality contain a location? base class method returns false
    # @param [Locuser::Location, #read] loc the location in question
    # @return [Boolean] default returns false.
    def contains?(loc)
      false
    end

    # don't want to index off of place name? - could have multiple entries w. similar names
    # create an index off of the place name, alone; will later create on off of the
    # geo locations *additionally*
    # index({ place_name: 1 }, { unique: false, name: "name_index"})

    # ** would like to hide these interfaces in a private/protected manner, not clear
    # ** how to do this in Ruby - doesn't have 'const' access similar to c++, etc.
    protected

        # include type in the name of this place (i.e. 'Washington state')
        def includetypeinname?
          return false
        end

        # set the entity type (each subclass should override)
        def get_entity_type
          'locality'
        end
  end   # class Place
end # module Places

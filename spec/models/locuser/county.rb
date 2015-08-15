
module Locuser
  class County < Locuser::Locality
    include Locuser::SpecBase

    protected
    def includetypeinname?
      return true
    end

    ##
    # Return the entity type (state); for taxonomy hierarchy
    # @return [String] this entity type (state)
    def get_entity_type
        return 'county'
    end

    ##
    # Valid parent types to support taxonomy hierarchy.
    # @return [String] valid parent
    def valid_parent_types
      return 'state'
    end

  end   # class County
end # module Places

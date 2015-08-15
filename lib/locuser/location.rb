# location.rb

require 'locuser/locality'

module Locuser

  ##
  # Describes a specific location - this is represented as a latitude/longitude.
  # Subclasses may contain addresses as well.
  class Location < Locuser::Locality

    # use geocoding?
    if Locuser::Configuration.config.use_geocoder
        require 'geocoder'

        Geocoder.configure( lookup: :google, timeout: 3, units: :mi)

        # geographical info
        field :coordinates, :type => Array

        # must come AFTER :coordinates field
        include Geocoder::Model::Mongoid
        geocoded_by :address
        after_validation    :geocode

        # allows indexing and searching by location.
        index({ location: "2dsphere" }, { min: -200, max: 200 })

        ##
        # access the latitude (Geocoder gem tends to store these backwards.)
        # @return [Float] the latitude
        def latitude
            self.to_coordinates[0]
        end

        ##
        # access the longitude (Geocoder gem tends to store these backwards.)
        # @return [Float] the longitude
        def longitude
            self.to_coordinates[1]
        end
    end

  end # module Location
end # module Locuser

# location.rb

require 'locuser/locality'

module Locuser

  ##
  # Describes a specific locaiton. If geocoding is turned via Locuser::Configuration
  # geocoding information is included within this class. When on - geocoding requires
  # an address as one line from the object, from which it determines coordinates.
  #
  class Location < Locuser::Locality

    # use geocoding?
    if Locuser.config.use_geocoder
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

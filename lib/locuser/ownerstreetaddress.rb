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

    ##
    # get the formatted street address.
    # @return [String] address as one line
    def full_address()
      unless self.owner == nil
        Locuser::Configuration.config.address_formatter.format( self.owner.address_hash )
      end
    end

    ##
    # get a particular address component. Generally :street1, :street2,
    # :city, :state, :zip, :country are supported.
    # @param [Hash] h the component to find
    # @return [String] address component, or nil if not present
    def address(h1=nil)
      if h1 == nil
        self.full_address
      else
        self.address_hash[h1]
      end
    end

    ##
    # set a particular address component. Generally :street1, :street2,
    # :city, :state, :zip, :country are supported.
    # @param [Hash] h the component to set
    # @param [String] val the value to set to
    # @return [String] address component, or nil if not present
    def set_address(h, val)
      self.address_hash[h] = val
    end

    ##
    # accessors for address components
    # @return [String] component from address, or nil if not present
    def street1(); (self.owner != nil) ? self.owner.street1 : nil; end
    def street2(); (self.owner != nil) ? self.owner.street2 : nil; end
    def city();(self.owner != nil) ? self.owner.city : nil; end
    def state(); (self.owner != nil) ? self.owner.state : nil; end
    def zip(); (self.owner != nil) ? self.owner.zip : nil; end
    def county(); (self.owner != nil) ? self.owner.county : nil; end
    def country(); (self.owner != nil) ? self.owner.country : nil; end

    ##
    # setters for address components (hides the hash interface)
    # @return [String] returns the hash that was setters
    def street1=(val); if (self.owner != nil); self.owner.street1 = val; end; end
    def street2=(val); if (self.owner != nil); self.owner.street2 = val; end; end
    def city=(val); if (self.owner != nil); self.owner.city = val; end; end
    def state=(val); if (self.owner != nil); self.owner.state = val; end; end
    def zip=(val); if (self.owner != nil); self.owner.zip = val; end; end
    def county=(val); if (self.owner != nil); self.owner.county = val; end; end
    def country=(val); if (self.owner != nil); self.owner.country = val; end; end


    protected
    # only allow subclass access to the address_hash
    included do
      field :address_hash, type: Hash, default: {}
    end

    ##
    # perform any initialization needed.
    def do_initialize
      # deprecated for now does nothing
      #self.name = (self.owner != nil) && (self.owner.respond_to?('name')) ? self.owner.name : "User: #{self.id}"
    end

  end   # class OwnerStreetAddress
end # module Places

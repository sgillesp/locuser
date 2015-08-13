# locuser/streetaddress.rb

require 'active_support/concern'

module Locuser
  ##
  # Class to handle street addresses - this is not necessarily stored as a
  # part of a Mongoid document, but rather handles all of the ins/outs of
  # managing an address and validates it against a directory service, if desired.
  # Code for actually handling the street address manipulation, etc. is separate,
  # therefore, from the localized (geolocated) address and taxonomic representation.
  module StreetAddress
    extend ActiveSupport::Concern

    ##
    # get the formatted street address.
    # @return [String] address as one line
    def full_address()
      Locuser::Configuration.config.address_formatter.format(self.address_hash)
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

    def street1(); self.address_hash[:street1]; end
    def street2(); self.address_hash[:street2]; end
    def city(); self.address_hash[:city]; end
    def state(); self.address_hash[:state]; end
    def zip(); self.address_hash[:zip]; end
    def county(); self.address_hash[:county]; end
    def country(); self.address_hash[:country]; end

    ##
    # setters for address components (hides the hash interface)
    # @return [String] returns the hash that was setters

    def street1=(val); self.address_hash[:street1] = val; end
    def street2=(val); self.address_hash[:street2] = val; end
    def city=(val); self.address_hash[:city] = val; end
    def state=(val); self.address_hash[:state] = val; end
    def zip=(val); self.address_hash[:zip] = val; end
    def county=(val); self.address_hash[:county] = val; end
    def country=(val); self.address_hash[:country] = val; end


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

  end   # class State
end # module Places

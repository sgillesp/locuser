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

    # ##
    # # get the formatted street address.
    # # @return [String] address as one line
    # def full_address()
    #   unless self.owner == nil
    #     Locuser.config.address_formatter.format( self.owner.address_hash )
    #   end
    # end

    ##
    # get a particular address component. Generally :street1, :street2,
    # :city, :state, :zip, :country are supported. This method will return
    # the address as one line if h1 is nil. This is needed to support geocoder
    # geolocation encoding (geocoder will call address, expecting a street address).
    # If the owner for this objec is nil, this method returns nil.
    # @param [Hash] h the component to find
    # @return [String] address component, or nil if not present
    def address(h1=nil)
      if h1 == nil
        Locuser.config.address_formatter.format( self.address_hash ) unless self.owner.nil?
      else
        self.address_hash[h1]
      end
    end

    ##
    # set a particular address component. Generally :street1, :street2,
    # :city, :state, :zip, :country are supported.
    # @param [String] val the value to set to
    # @param [Hash] h the component to set
    # @return [String] address component, or nil if not present
    def set_address(val, h = nil)
      unless self.owner.nil?
        case h
        when :street1
          self.owner.street1 = val
        when :street2
          self.owner.street2 = val
        when :city
          self.owner.city = val
        when :state
          self.owner.state = val
        when :county
          self.owner.county = val
        when :country
          self.owner.country = val
        when :zip
          self.owner.zip = val
        else
          self.address = val
        end
      end
    end

    ##
    # set the address to a string, which will try to parse the address
    # using the default parser via Locuser::Configuration. If this is
    # not available does nothing. !!! Could have this throw exception in
    # the future.
    # @param [String] s the address to set to
    # @return [String] address component, or nil if not present
    def address=(s)
      p = Locuser.config.parser
      unless p.nil?
        a = p.parse(s)
        self.street1 = "#{a.number} #{a.street} #{a.street_type}"
        self.street2 = a.street2
        self.city = a.city
        self.state = a.state
        self.zip = a.zip
        self.country = a.country
      end
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

    def address_hash
      { :street1 => self.street1,
        :street2 => self.street2,
        :city => self.city,
        :state => self.state,
        :zip => self.zip }
    end

    ##
    # perform any initialization needed.
    def do_initialize
      # deprecated for now does nothing
      #self.name = (self.owner != nil) && (self.owner.respond_to?('name')) ? self.owner.name : "User: #{self.id}"
    end

  end   # class OwnerStreetAddress
end # module Places

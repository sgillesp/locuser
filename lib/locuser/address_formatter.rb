# locuser/address_formatter.rb

module Locuser
  ##
  # Class to handle formatting of addresses from a hash containing a specific pattern
  # There is a default class which will format the address from the hash as follows:
  #    "street1 street2 city, state[not abbreviated]  zip"
  # Note that country is left off by default but the use_country flag will cause this
  # to append to the end. Further the
  class AddressFormatter

    ##
    # get the use_country flag
    # @return [Boolean] the value of the flag
    def use_country
      @use_country
    end

    ##
    # set the use_country flag
    # @param [Boolean] val new value
    def use_country=(val)
      @use_country = val
    end

    ##
    # perform address formatting using the given hash. Expects that the hash will
    # contain Strings hashed by :street1, :street2, etc...
    # @param [Hash] hsh as the given hash
    # @return [String] address as one line
    def format(hsh)
      str = String.new
      unless hsh[:street1] == nil; str << hsh[:street1]; end
      unless hsh[:street2] == nil; str << ((str.empty?l) ? '' : ' ') << hsh[:street2]; end
      unless hsh[:city] == nil; str << ((str.empty?) ? '' : ' ')  << hsh[:city]; end
      unless hsh[:state] == nil; str << ((str.empty?) ? '' : ', ')  << hsh[:state]; end
      unless hsh[:zip] == nil; str << ((str.empty?) ? '' : '  ')  << hsh[:zip]; end
      unless (!@use_country || hsh[:country] == nil); str << ((str.empty?) ? '' : ' ')  << hsh[:country]; end
      return str
    end

    protected
    def initialize(use_country = false)
      super()
      @use_country = use_country
    end



  end   # class AddressFormatter
end # module Places

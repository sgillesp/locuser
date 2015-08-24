# locuser/address_formatter.rb

require 'locuser/util'

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
    # hash from address. Creates a hash from an address putting different components of the
    # address to a key-value pair. Returns and empty hash if no parser is available.
    # @param [String] s the string to convert to a hash
    # @return [Hash] a hash of the asddress compoenents in the string, {} if cannot
    def s_to_h(s)
      # try to use the configured parser if available; does a lot of error checking here
      if (Locuser.config.parser_class.nil? || !Locuser.config.parser_class.respond_to?(:parse))
        return Hash.new
      else
        a = Locuser.config.parser_class.parse(s)
        return a.to_h unless a.nil?
      end
      return {}
    end

    ##
    # perform address formatting using the given hash. First will try to use the parser class to do this; failing that use a standard
    # method, hwich is to dump the hash, in sequence separated by spaces.
    # @param [Hash] hsh as the given hash
    # @return [String] address as one line
    def h_to_s(hsh)
      if Locuser.config.parser_class.nil? || !Locuser.config.parser_class.respond_to?(:create)
        str = String.new
        hsh.each do |key,val|
          unless (key == :country && !@use_country)
            pre = (val.nil? || str.empty?) ? '' : ([:city,:state].include?(key) ? ', ' : ' ')
            str << pre
            str << val unless val.nil?
          end
        end
        return str
      else
         Locuser.config.parser_class.create(hsh).to_s
      end
    end

    protected
    def initialize(use_country = false)
      super()
      @use_country = use_country
    end

  end   # class AddressFormatter
end # module Places

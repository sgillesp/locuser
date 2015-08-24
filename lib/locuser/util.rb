# util.rb
# utility functions for the locuser library

module Locuser
end

module StreetAddress
  class US

      ##
      # create an address object
      class << self

        def create(arg)
          (arg.nil? || arg.empty?) ? Address.new({}) : Address.new(arg)
        end

      end

      ##
      # Add to_h and comparison to the address patch; this should be present
      # once the StreetAddress 2.0.x gem is released.
      class Address

        def to_h
          self.instance_variables.each_with_object({}) do |var_name, hash|
            var_value = self.instance_variable_get(var_name)
            hash_name = var_name[1..-1].to_sym
            hash[hash_name] = var_value
          end
        end

        ##
        # compare one address to another
        def ==(other)
          to_s == other.to_s
        end

      end

  end
end

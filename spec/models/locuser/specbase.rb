# locuserspec.rb

require 'locuser/locality'
require 'active_support'

module Locuser
  module SpecBase
    extend ActiveSupport::Concern

    included do
      field :description, type: String
      field :name, type: String

    end
  end
end

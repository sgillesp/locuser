require "locuser/engine"
require "locuser/configuration"

module Locuser

  # Locuser configuration options. The configuration object can be reached as Locuser.configure or Locuser.config

  class << self
      attr_writer :configiration
  end

  def self.config
      @configuration ||= Locuser::Configuration.new
  end

  def self.configure
      yield(config)
  end

  def self.reset
      @configuration = Locuser::Configuration.new
  end

end

require "logger"
require "tiny_crypto/version"
require 'tiny_crypto/errors/configuration'
require "tiny_crypto/aes_crypt"
require "tiny_crypto/configuration"
require "tiny_crypto/service"

module TinyCrypto
  class << self
    attr_accessor :configuration
    attr_writer :logger
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.logger
    @logger ||= ::Logger.new($stdout).tap do |log|
      log.progname = self.name
    end
  end

  def self.configure
    yield(configuration)
  end
end

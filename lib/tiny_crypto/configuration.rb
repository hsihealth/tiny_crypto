module TinyCrypto

  # Adds global configuration settings to the gem, including:
  #
  # * `config.access_key` - TinyCrypto access key
  # * `config.aes_key` - AES key used in TinyCrypto service
  # * `config.aes_iv` - AES IV used TinyCrypto service
  #
  # # Required fields
  #
  # The following fields are *required* to use the gem:
  #
  # - Access key
  # - AES key
  # - AES IV
  #
  # The gem will raise a `Errors::Configuration` if you fail to provide these keys.
  #
  # # Configuring your gem
  #
  # ```
  # TinyCrypto.configure do |config|
  #   config.access_key = ''
  #   config.aes_key = ''
  #   config.aes_iv = ''
  # end
  # ```
  #
  # # Accessing configuration settings
  #
  # All settings are available on the `TinyCrypto.configuration` object:
  #
  # ```
  # TinyCrypto.configuration.access_key
  # TinyCrypto.configuration.aes_key
  # TinyCrypto.configuration.aes_iv
  # ```
  # # Resetting configuration
  #
  # To reset, simply call `TinyCrypto.reset`.
  #
  class Configuration
    attr_writer :aes_key, :aes_iv, :access_key

    def initialize
      @access_key = nil
      @aes_key = nil
      @aes_iv = nil
    end

    def access_key
      raise Errors::Configuration, "TinyCrypto access key missing! See the documentation for configuration settings." unless @access_key
      @access_key
    end

    def aes_key
      raise Errors::Configuration, "TinyCrypto AES key missing! See the documentation for configuration settings." unless @aes_key
      @aes_key
    end

    def aes_iv
      raise Errors::Configuration, "TinyCrypto AES iv missing! See the documentation for configuration settings." unless @aes_iv
      @aes_iv
    end
  end
end
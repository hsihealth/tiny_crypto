require 'base64'

module TinyCrypto
  class Service
    attr_reader :cipher_type

    def initialize
      @cipher_type = "AES-128-CBC"
    end

    def encrypt_message(plain_text)
      encrypted = AesCrypt.encrypt(plain_text, TinyCrypto.configuration.aes_key, TinyCrypto.configuration.aes_iv, cipher_type)
      Base64.encode64(encrypted)
    end

    def decrypt_message(cipher_text)
      begin
        decoded = Base64.decode64(cipher_text)
        AesCrypt.decrypt(decoded, TinyCrypto.configuration.aes_key, TinyCrypto.configuration.aes_iv, cipher_type)
      rescue Exception => e
        Rails.logger.error(e)
      end
    end

    def encrypted_access_key
      encrypt_message(access_key)
    end

    def access_key
      Base64.encode64(TinyCrypto.configuration.access_key).strip
    end
  end
end
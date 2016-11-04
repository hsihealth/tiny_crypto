require 'spec_helper'

describe TinyCrypto::Service do
  before :each do
    TinyCrypto.configure do |config|
      config.access_key = "My Access Key"
      config.aes_key = "key with enough length"
      config.aes_iv = "iv with enough length"
    end
  end
  let(:svc){TinyCrypto::Service.new}

  describe "#encrypt_message" do
    let(:message){"Hellow world!"}

    it "should encrupt the message by calling AesCrypt.encrypt with proper parameters and return it base 64 encoded" do
      expect(TinyCrypto::AesCrypt).to receive(:encrypt).with(message, TinyCrypto.configuration.aes_key, TinyCrypto.configuration.aes_iv, svc.cipher_type).and_return("encrypted")
      expect(Base64).to receive(:encode64).with("encrypted")
      svc.encrypt_message(message)
    end
  end

  describe "#decrypt_message" do
    let(:message){Base64.encode64("Hellow world!")}

    it "should decode the message and decrypt it by calling AesCrypt.decrypt with proper parameters and return it base 64 encoded" do
      expect(Base64).to receive(:decode64).with(message).and_return("decoded message")
      expect(TinyCrypto::AesCrypt).to receive(:decrypt).with("decoded message", TinyCrypto.configuration.aes_key, TinyCrypto.configuration.aes_iv, svc.cipher_type)
      svc.decrypt_message(message)
    end
  end

  it "should be able to decrypt encrypted message" do
    message = "Hellow world!"
    encrypted = svc.encrypt_message(message)
    expect(svc.decrypt_message(encrypted)).to eq(message)
  end

  describe "#encrypted_access_key" do
    it "should call #encrypt_message to return encrypted access_key" do
      expect(svc).to receive(:encrypt_message).with(svc.access_key)
      svc.encrypted_access_key
    end
  end

  describe "#access_key" do
    it "should be base 64 encoded" do
      expect(Base64).to receive(:encode64).at_least(:once).with(TinyCrypto.configuration.access_key).and_return("something")
      svc.access_key
    end

    it "should be properly encoded" do
      expect(Base64).to receive(:encode64).at_least(:once).with(TinyCrypto.configuration.access_key).and_return("something")
      expect(svc.access_key).not_to eq(TinyCrypto.configuration.access_key)
      expect(svc.access_key).to eq(Base64.encode64(TinyCrypto.configuration.access_key))
    end
  end
end


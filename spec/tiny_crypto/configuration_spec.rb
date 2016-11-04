require 'spec_helper'

describe TinyCrypto::Configuration do
  it "should raise error when accessing unconfigured attributes" do
    config = TinyCrypto::Configuration.new
    expect(lambda{config.access_key}).to raise_error(TinyCrypto::Errors::Configuration)
    expect(lambda{config.aes_key}).to raise_error(TinyCrypto::Errors::Configuration)
    expect(lambda{config.aes_iv}).to raise_error(TinyCrypto::Errors::Configuration)
  end

  it "should not raise error when accessing configured attributes" do
    config = TinyCrypto::Configuration.new
    config.access_key = "my key"
    config.aes_key = "high"
    config.aes_iv = "low"
    expect(config.access_key).to eq("my key")
    expect(config.aes_key).to eq("high")
    expect(config.aes_iv).to eq("low")
  end
end

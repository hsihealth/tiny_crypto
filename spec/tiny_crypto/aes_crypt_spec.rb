require 'spec_helper'
require 'base64'

describe TinyCrypto::AesCrypt do
  let(:key){"ThisIsMyDamnKey343"}
  let(:iv){"ThisIsMyDamnIV33434"}
  let(:cipher_type){"AES-128-CBC"}
  let(:message){'{"SourceSystem_ID":"tbd","ProfitCenter":{"ProfitCenter_ID":200,"Provider_ID":2,"Name":"AA Base 1","IsDeleted":false}}'}

  it "should encrypt a given message" do
    cipher = TinyCrypto::AesCrypt.encrypt message, key, iv, cipher_type
    expect(cipher).not_to be_nil
    expect(cipher.length > 0).to eq(true)
    expect(cipher).not_to eq(message)
  end

  it "should decrypt a given encrypted message" do
    cipher = TinyCrypto::AesCrypt.encrypt message, key, iv, cipher_type
    plain = TinyCrypto::AesCrypt.decrypt cipher, key, iv, cipher_type
    expect(plain).to eq(message)
  end
end
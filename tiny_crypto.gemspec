# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiny_crypto/version'

Gem::Specification.new do |spec|
  spec.name          = "tiny_crypto"
  spec.version       = TinyCrypto::VERSION
  spec.authors       = ["Alex Wang"]
  spec.email         = ["alexw668@gmail.com"]
  spec.summary       = %q{A simple crypto service}
  spec.description   = %q{A simple symmetric-key cryptography service that uses AES standard for plain text encryption and decryption}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir["LICENSE.txt", "README.md", "lib/**/*.rb"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'fuubar'
end

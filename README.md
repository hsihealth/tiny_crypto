# TinyCrypto

A simple crypto service

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tiny_crypto', :git => "https://github.com/alexw668/tiny_crypto.git"
```

For now I am not sure if I want to release this gem to RubyGems, but if I do and have done that, you can install it by simply typing:
```
$ gem install tiny_crypto
```

or add this line in your Gemfile:
```ruby
gem "tiny_crypto"
```

Don't forget to run the following after you install the gem:

```
$ bundle
```

## Configuration

A set of attributes should be configured in the gem setup. You can do this anywhere in your application initializer.

```ruby
TinyCrypto.configure do |config|
  config.access_key = ''
  config.aes_key = ''
  config.aes_iv = ''
end
```

* `config.access_key` - An access_key that can be used for communication between two apps.
* `config.aes_key` - KEY value used by the AES algorithm.
* `config.aes_iv` - IV value used by the AES algorithm.


Configured attributes are available to you throughout your application as:

```ruby
TinyCrypto.configuration.access_key
TinyCrypto.configuration.aes_key
TinyCrypto.configuration.aes_iv
```

## Usage

Once configured, you can use the service like this:

```ruby
svc = TinyCrypto::Service.new

messge_encrpted = svc.encrypt_message "Hellow World!"
message_decrypted = svc.decrypt_message(messge_encrpted)

# get encrypted access key:
my_key = svc.encrypted_access_key

```

## Contributing

1. Fork it ( https://github.com/alexw668/tiny_crypto/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

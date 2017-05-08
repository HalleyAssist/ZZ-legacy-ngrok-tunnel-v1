# ngrok-tunnel-v1 [![Gem version](http://img.shields.io/gem/v/ngrok-tunnel-v1.svg?style=flat-square)](http://rubygems.org/gems/ngrok-tunnel-v1)

Ruby gem wrapping [ngrok](https://ngrok.com) v1.

If you're using ngrok v2+, then this gem is not for you; use the [ngrok-tunnel](https://github.com/bogdanovich/ngrok-tunnel) gem instead.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ngrok-tunnel-v1'
```

And then execute:

```bash
$ bundle install
```

Lastly, install the ngrok v1 binary and ensure that it is available in your `PATH`.

## Usage

A basic example:

```ruby
require 'ngrok-tunnel-v1'

tunnel = NgrokV1::Client.new(port: 3000, protocol: 'http')

tunnel.start

tunnel.running? # => true

tunnel.uri # => http://75cab18e.ngrok.com

tunnel.stop

tunnel.running? # => false
```

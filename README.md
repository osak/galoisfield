# Galoisfield

![Build Status](https://travis-ci.org/osak/galoisfield.png)

Performs calculation over modulus.

## Installation

Add this line to your application's Gemfile:

    gem 'galoisfield'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install galoisfield

## Usage

```ruby
require 'galoisfield'

a = 42.to_galois(11) #=> 9(mod 11)
a += 4 #=> 2(mod 11)
b = a * 5 #=> 10(mod 11)

# Supported operators
puts a + 10
puts a - 10
puts a * 10
puts a / 10
puts a ** 10
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Globe

Reimplements globals entirely, providing `global_variable_set`, `global_variable_get`, and `global_variable_defined`.

Since you lose the `$X = ...` syntax, it provides a `global` helper method.

"The most straightfaced implementation of an unnecessary idea." –@mistydemeo

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'globe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install globe

## Usage

```ruby
require 'globe'

global_variable_get(:foo) #=> nil
global_variable_defined?(:foo) #=> false

global_variable_set(:foo, 'bar') #=> 'bar'

global_variable_get(:foo) #=> 'bar'
global_variable_defined?(:foo) #=> true

global :foo #=> 'bar'
global foo: 'baz' #=> {foo: 'baz'}
global :foo #=> 'baz'
global_variable_get(:foo) #=> 'baz'
```

## Contributing

1. Fork it ( https://github.com/duckinator/globe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Merge Request

# Spinny::GlobalVariables

Reimplements globals entirely, providing `global_variable_set`, `global_variable_get`, and `global_variable_defined`.

Since you lose the `$X = ...` syntax, it provides a `global` helper method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spinny-global_variables'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spinny-global_variables

## Usage

```ruby
require 'spinny/global_variables'

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

1. Fork it ( https://gitlab.com/spinny/spinny-global_variables/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Merge Request

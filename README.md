# LibParser

A library to help load and interpret data files.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lib_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lib_parser

## Usage

Just instanciate a new object, passing the file's separator, in order to correctly parse the headers and the values of the file.


> Example file (with a hiphen as separator)
```plain
client name-purchase item-price
John Doe-Awesome gamepad-10
Johnny John-Mouse-15
```


```ruby
require 'lib_parser'

# Create a instance and set the separator of the file
parser = LibParser::File.new(file: '/path/to/file', separator: '-')

# Receive a hash containing the headers as the keys and their values
parsed_file = parser.parse_file!

parsed_file # Returns an Array of hashes containing the data.
# [
#   { client_name: 'John Doe', purchase_item: 'Awesome gamepad', price: '10' },
#   { client_name: 'Johnny John', purchase_item: 'Mouse', price: '15' }
# ]

```

If you want only get the headers, you can call the method `parse_headers`, returing a Hash containing the headers as keys and their index (zero-based) as values:

```ruby
parser = LibParser::File.new(file: '/path/to/file', separator: '-')
headers = parser.parse_headers

headers # { client_name: 0, purchase_item: 1, price: 2 }
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

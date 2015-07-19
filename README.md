# FileIterator

Handles iterating through a file given as a parameter to a script.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'file_iterator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_iterator

## Usage

see examples.rb for examples of usage.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/file_iterator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Publishing the gem

(first update the version number)

    gem build file_iterator.gemspec
    gem push file_iterator-0.0.2.gem
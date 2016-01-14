# UmtsCustomCops

[![Build Status](https://travis-ci.org/umts/custom-cops.svg?branch=master)](https://travis-ci.org/umts/custom-cops)

Custom Rubocops, currently all related to RSpec, used for UMass Transit's internal Rails development purposes.

Primary contributor is @dfaulken.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'umts-custom-cops'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install umts-custom-cops

## Usage

TODO: Instructions on adding custom cops.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To run the spec files, you'll need Rubocop's spec support methods. In order to achieve this, set up RuboCop as a git submodule:

    $ git submodule add -f https://github.com/bbatsov/rubocop

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/umts/custom-cops.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

# UmtsCustomCops

Custom Rubocops, currently all related to RSpec, used for UMass Transit's
internal Rails development purposes.

A lot of the ideas for this came from some reading of the rubocop source
code, so thanks to the RuboCop team for making it public.

[![Build Status][travis-badge]][travis]
[![Test Coverage][coverage-badge]][codeclimate]
[![Code Climate][gpa-badge]][codeclimate]
[![Issue Count][issue-badge]][codeclimate]

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

Add to your `rubocop.yml`:

```xml
require: umts-custom-cops
```

Or on the command line:

    $ rubocop --require=umts-custom-cops

You may enable/disable them just as with any other cop.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/umts/custom-cops.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

[travis]: https://travis-ci.org/umts/custom-cops
[codeclimate]: https://codeclimate.com/github/umts/custom-cops/coverage
[travis-badge]: https://travis-ci.org/umts/custom-cops.svg?branch=master
[coverage-badge]: https://codeclimate.com/github/umts/custom-cops/badges/coverage.svg
[gpa-badge]: https://codeclimate.com/github/umts/custom-cops/badges/gpa.svg
[issue-badge]: https://codeclimate.com/github/umts/custom-cops/badges/issue_count.svg

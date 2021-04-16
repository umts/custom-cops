# UmtsCustomCops

**This gem is no longer under development.** All of the cops contained in this
gem are also available in the [rubocop-rspec][rr] gem.

## Migrating to rubocop-rspec

* Remove `gem 'umts-custom-cops'` from your Gemfile
* Add `gem 'rubocop-rspec'` to your Gemfile
* Remove `require: umts-custom-cops` from your `.rubocop.yml` file
* Add `require: rubocop-rspec` to your `.rubocop.yml` file

If you _only_ want a version of the two cops provided by this gem, you can
add the following to your `.rubocop.yml` file:

```yml
RSpec:
  Enabled: false

RSpec/BeEql:
  Enabled: true

RSpec/PredicateMatcher:
  Enabled: true
```

Also, if you have a custom `.yml` file to get this gem to work under
CodeClimate, you will not need to do that with `rubocop-rspec`. It is included
in the CodeClimate engine.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

[rr]: https://github.com/rubocop/rubocop-rspec

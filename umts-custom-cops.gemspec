# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'umts-custom-cops/version'

Gem::Specification.new do |spec|
  spec.name          = 'umts-custom-cops'
  spec.version       = UmtsCustomCops::VERSION
  spec.authors       = ['UMass Transit Services']
  spec.email         = ['transit-it@admin.umass.edu']

  spec.summary       = 'Custom Rails-specific Rubocop cops
                          for our internal development purposes'
  spec.homepage      = 'https://github.com/umts/custom-cops'
  spec.license       = 'MIT'

  spec.post_install_message = <<~PIM
    umts-custom-cops is no longer under development, and all functionality
    provided by this gem can also be found in the `rubocop-rspec` gem. See
    the README file:

    https://github.com/umts/custom-cops/blob/master/README.md

    for migration instructions.
  PIM

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  raise <<~MSG unless spec.respond_to?(:metadata)
    RubyGems 2.0 or newer is required to protect against public gem pushes.
  MSG

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_dependency 'rubocop', '~> 1.10'

  spec.add_development_dependency 'bundler', '~> 2.1', '>= 2.1.4'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov'
end

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

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'rubocop', '0.65.0'

  spec.add_development_dependency 'bundler', File.open('.bundler.version').read.strip
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'simplecov'
end

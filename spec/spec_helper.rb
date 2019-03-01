require 'rubocop'
require 'simplecov'

SimpleCov.start do
  add_filter '/vendor'
  refuse_coverage_drop
end

require 'rubocop/rspec/support'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'umts-custom-cops'

require 'rubocop'
require 'simplecov'

SimpleCov.start do
  add_filter '/vendor'
  refuse_coverage_drop
end

rubocop_path = File.join(File.dirname(__FILE__), '../vendor/rubocop')
unless File.directory?(rubocop_path)
  fail "Can't run specs without a local RuboCop checkout. See README."
end
require "#{rubocop_path}/spec/support/cop_helper"

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'custom-cops'

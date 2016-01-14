require 'rubocop'

rubocop_path = File.join(File.dirname(__FILE__), '../vendor/rubocop')
unless File.directory?(rubocop_path)
  fail "Can't run specs without a local RuboCop checkout. See README."
end
Dir["#{rubocop_path}/spec/support/**/*.rb"].each(&method(:require))

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'custom-cops'

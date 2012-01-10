require 'bundler/setup'
require 'rspec/mocks'
require 'dojo'

RSpec.configure do |config|
  config.mock_with :mocha
end
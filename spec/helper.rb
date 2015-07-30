require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'fantasydata'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def new_test_client
  client = Fantasydata::Client.new.configure { |d| d.api_key = "API" }
  #Param encoder is being set here because webmock expects params encodeded a certain way
  #Normally, you won't set this option, it's already configured for Fantasydata in lib/echowrap/default.rb
  client.connection_options[:request][:params_encoder] = Faraday::NestedParamsEncoder
  client
end

def a_get(path)
  a_request(:get, Fantasydata::Default::ENDPOINT + path)
end

def stub_get(path)
  stub_http_request(:get, Fantasydata::Default::ENDPOINT + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

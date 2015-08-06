# Fantasydata

[![Gem Version](https://badge.fury.io/rb/fantasydata.svg)](http://badge.fury.io/rb/fantasydata)[![Build Status](https://travis-ci.org/Drosty/fantasydata.svg?branch=master)](https://travis-ci.org/Drosty/fantasydata)[![Code Climate](https://codeclimate.com/github/Drosty/fantasydata/badges/gpa.svg)](https://codeclimate.com/github/Drosty/fantasydata)[![Test Coverage](https://codeclimate.com/github/Drosty/fantasydata/badges/coverage.svg)](https://codeclimate.com/github/Drosty/fantasydata/coverage)


A Ruby interface to the Fantasy Data API.  The Fantasy Data API delivery historical and up to the second NFL, NBA and MLB data.  This gem currently only supports the NFL Data but could be expanded to include the others as well.  Details about the API can be found here: [https://developer.fantasydata.com/documentation](https://developer.fantasydata.com/documentation).  For a Implementation guide check out this page: [http://fantasydata.com/resources/implementation-guide.aspx](http://fantasydata.com/resources/implementation-guide.aspx).

## Inspiration
I relied heavily on the [Echowrap](https://github.com/timcase/echowrap) gem to follow best practices around the structure of the gem, tests and documentation.

## Supported Rubies

The following Ruby versions are tested in [Travis CI](https://travis-ci.org/Drosty/fantasydata):
  - 2.2.2
  - 2.2.0
  - 2.1.5
  - 2.0.0
  - 1.9.3
  - jruby-19mode
  - rbx-18mode
  - rbx-19mode

## Gem Dependencies

Installing this gem also installs the following gems:

 - [faraday](https://github.com/lostisland/faraday) HTTP client lib that provides a common interface over many adapters (such as Net::HTTP) and embraces the concept of Rack middleware when processing the request/response cycle.
 - [multi_json](https://github.com/intridea/multi_json) A common interface to multiple JSON libraries, including Oj, Yajl, the JSON gem (with C-extensions), the pure-Ruby JSON gem, NSJSONSerialization, gson.rb, JrJackson, and OkJson.

## Installation

Add this line to your application's Gemfile:

    gem 'fantasydata'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fantasydata

## Usage

Go to [Fantasy Data](http://www.fantasydata.com]) and sign up for an account to get an API Key.

Then copy and paste in your API keys:

```ruby
Fantasydata.configure do |config|
  config.api_key =       'YOUR_API_KEY'
end
```
If you are using Fantasydata with a Rails application then a good location for the key would be to create an initializer, for example you could place the above code in /config/initializers/fantasydata.rb.

You can now use Fantasydata like this:

```ruby
Fantasydata.current_week
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

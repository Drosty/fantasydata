# Fantasydata

Check https://github.com/Drosty/fantasydata/wiki/Checklist for status on completed and incomplete endpoints.

[![Gem Version](https://badge.fury.io/rb/fantasydata.svg)](http://badge.fury.io/rb/fantasydata)[![Build Status](https://travis-ci.org/Drosty/fantasydata.svg?branch=master)](https://travis-ci.org/Drosty/fantasydata)[![Code Climate](https://codeclimate.com/github/Drosty/fantasydata/badges/gpa.svg)](https://codeclimate.com/github/Drosty/fantasydata)[![Test Coverage](https://codeclimate.com/github/Drosty/fantasydata/badges/coverage.svg)](https://codeclimate.com/github/Drosty/fantasydata/coverage)


A Ruby interface to the Fantasy Data API.  The Fantasy Data API delivery historical and up to the second NFL, NBA and MLB data.  This gem currently only supports the NFL Data but could be expanded to include the others as well.  Details about the API can be found here: https://developer.fantasydata.com/documentation

## Inspiration
I relied heavily on the [Echowrap](https://github.com/timcase/echowrap) gem to follow best practices around the structure of the gem, tests and documentation.

## Supported Rubies

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

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

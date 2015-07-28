# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fantasydata/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Drost"]
  gem.email         = ["ryan.s.drost@gmail.com"]
  gem.description   = %q{Wrap www.fantasydata.com API}
  gem.summary       = %q{This gem will wrap the FantasyData API and give easy access to the calls that can be made}
  gem.homepage      = "https://github.com/Drosty/fantasydata"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fantasydata"
  gem.require_paths = ["lib"]
  gem.version       = Fantasydata::VERSION
end

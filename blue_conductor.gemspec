# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blue_conductor/version"

Gem::Specification.new do |gem|
  gem.name          = "blue_conductor"
  gem.version       = BlueConductor::VERSION
  gem.authors       = ["Alex Williams", "Craig Williams"]
  gem.email         = ["alexwilliams4@me.com"]
  gem.description   = %q{Scrapes azLyrics.com for song lyrics}
  gem.summary       = %q{azlyrics.com scraper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'nokogiri'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'fakeweb'
  gem.add_development_dependency 'rake'
end

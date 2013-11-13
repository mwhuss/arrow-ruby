# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arrow/version'

Gem::Specification.new do |spec|
  spec.name          = "arrow-ruby"
  spec.version       = Arrow::VERSION
  spec.authors       = ["Marshall Huss"]
  spec.email         = ["mwhuss@gmail.com"]
  spec.description   = "Ruby gem to talk to the Arrow push notification service"
  spec.summary       = "Ruby gem to talk to the Arrow push notification service"
  spec.homepage      = "https://github.com/mwhuss/arrow-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency                   'rest-client',  '~> 1.6.7'
  spec.add_dependency                   'json',         '~> 1.8.1'

  spec.add_development_dependency       'bundler',      '~> 1.3'
  spec.add_development_dependency       'rake'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omdb/api/version'

Gem::Specification.new do |spec|
  spec.name          = "omdb-api"
  spec.version       = Omdb::Api::VERSION
  spec.authors       = ["Nick Palaniuk"]
  spec.email         = ["npalaniuk@gmail.com"]

  spec.summary       = %q(Ruby interface for the OMDB API)
  spec.description   = %q(A ruby interface for the OMDB API)
  spec.homepage      = "https://github.com/nikkypx/omdb-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "rest-client"
end

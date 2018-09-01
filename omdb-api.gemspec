# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omdb/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'omdb-api'
  spec.version       = Omdb::Api::VERSION
  spec.authors       = ['Nick Palaniuk']
  spec.email         = ['npalaniuk@gmail.com']
  spec.summary       = 'Ruby interface for the OMDB API'
  spec.description   = 'A ruby interface for the OMDB API'
  spec.homepage      = 'https://github.com/nikkypx/omdb-api'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']
  spec.add_dependency 'httparty'
  spec.add_dependency 'klass_param'
  spec.add_development_dependency 'bundler'
end

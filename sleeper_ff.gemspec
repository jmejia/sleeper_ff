# frozen_string_literal: true

require_relative "lib/sleeper_ff/version"

Gem::Specification.new do |spec|
  spec.name = "sleeper_ff"
  spec.version = SleeperFF::VERSION
  spec.authors = ["Josh Mejia"]
  spec.email = ["joshua.mejia@gmail.com"]

  spec.summary = "Ruby toolkit for the Sleeper Fantasy Football API"
  spec.description = "Ruby toolkit for the Sleeper Fantasy Football API"
  spec.homepage = "https://github.com/jmejia/sleeper_ff"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.require_paths = ["lib"]
  spec.files = Dir.glob("{bin,lib}/**/*") + %w[LICENSE.txt README.md]

  spec.add_dependency "faraday", ">= 1.0"
  spec.add_dependency "sawyer", "~> 0.9.0"

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "pry", "~> 0.14.0"
end

# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mad_rubocop/version"

Gem::Specification.new do |spec|
  spec.name          = "mad_rubocop"
  spec.version       = MadRubocop::VERSION
  spec.authors       = ["Zach Toolson"]
  spec.email         = ["zach.toolson@mx.com"]

  spec.summary       = "Wrapper for MX specific RuboCop settings. https://twitter.com/madrubocop"
  spec.description   = "Wrapper for MX specific RuboCop settings for managing custom settings across many projects."
  spec.homepage      = "https://github.com/mxenabled/mad_rubocop"
  spec.license       = "MIT"

  # Ship only what consumers load via `inherit_gem`; bin/setup is a dev script, not an executable.
  spec.files         = Dir.glob(%w(.rubocop.yml lib/**/*.{rb,yml} CHANGELOG.md LICENSE.txt README.md), :base => __dir__)
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1"

  spec.add_dependency "rubocop", "~> 1.91.0"
  spec.add_dependency "rubocop-performance", "~> 1.27.0"
  spec.add_dependency "rubocop-rails", "~> 2.38.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "osha/version"

Gem::Specification.new do |spec|
  spec.name          = "OSHA"
  spec.version       = OSHA::VERSION
  spec.authors       = ["Blake Williams"]
  spec.email         = ["blake@blakewilliams.me"]

  spec.summary       = %q{Occupational Safety and Health Automation}
  spec.description   = %q{Occupational Safety and Health Automation}
  spec.homepage      = "https://github.com/BlakeWilliams/OSHA"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "ruby_parser", "~> 3.10"
end

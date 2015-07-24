# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid/sequencer/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid-sequencer"
  spec.version       = Mongoid::Sequencer::VERSION
  spec.authors       = ["Thales Pereira"]
  spec.email         = ["thalesfp@gmail.com"]

  spec.summary       = %q{Add increment behave like a sequence number}
  spec.description   = %q{Mongoid sequencer add increment behave like a sequence number}
  spec.homepage      = "http://github.com/thalesfp/mongoid-sequencer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'mongoid', '~> 4.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end

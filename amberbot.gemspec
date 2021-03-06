# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amberbot/version'

Gem::Specification.new do |spec|
  spec.name          = "amberbot"
  spec.version       = AmberBot::VERSION
  spec.authors       = ["蒼時弦也"]
  spec.licenses      = ["Apache 2.0"]
  spec.email         = ["elct9620@frost.tw"]

  spec.summary       = %q{A easier chat bot develop kit.}
  spec.description   = %q{A easier chat bot develop kit. }
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack", "~> 2.0"
  spec.add_runtime_dependency "activesupport", "~> 5.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "fuubar", "~> 2.0"
  spec.add_development_dependency "simplecov", "~> 0.11"
  spec.add_development_dependency "guard", "~> 2.14"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.5"
  spec.add_development_dependency "rack-test"
end

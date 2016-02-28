# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'awesome_rails_console/version'

Gem::Specification.new do |spec|
  spec.name          = "awesome_rails_console"
  spec.version       = AwesomeRailsConsole::VERSION
  spec.authors       = ["Bruce Li"]
  spec.email         = ["ascendbruce@gmail.com"]

  spec.summary       = %q{Simple and useful rails console enhancements}
  spec.description   = %q{Enhance rails console by using awesome_print, pry and several pry plugins. And useful prompt tweaks. Makes rails console awesome by default.}
  spec.homepage      = "https://github.com/ascendbruce/awesome_rails_console"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"
  spec.license               = "MIT"

  # Runtime dependencies
  spec.add_dependency "railties"
  spec.add_dependency "pry-rails"
  spec.add_dependency "awesome_print"

  # gem development dependency
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end

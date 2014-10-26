# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_iterator/version'

Gem::Specification.new do |spec|
  spec.name          = "file_iterator"
  spec.version       = FileIterator::VERSION
  spec.authors       = ["B Blinken"]
  spec.email         = ["drblinken@gmail.com"]
  spec.summary       = %q{Eases iterating through a file}
  spec.description   = %q{Little helper gem that makes iterating through a file a one-liner.}
  spec.homepage      = "https://github.com/drblinken/file_iterator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

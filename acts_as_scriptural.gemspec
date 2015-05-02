# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_scriptural/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_scriptural"
  spec.version       = ActsAsScriptural::VERSION
  spec.authors       = ["Philip Bradley"]
  spec.email         = ["pdbradley@gmail.com"]
  spec.summary       = %q{Parse multibook, multiverse bible references}
  spec.description   = %q{Parse multibook, multiverse bible references of the form: Acts 1:1-10; Eph 1:5-10; John 12:4}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end

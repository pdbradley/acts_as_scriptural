Gem::Specification.new do |spec|
  spec.name          = "acts_as_scriptural"
  spec.version       = '0.0.3'
  spec.authors       = ["Philip Bradley"]
  spec.email         = ["pdbradley@gmail.com"]
  spec.summary       = %q{Parse multibook, multiverse bible references}
  spec.description   = %q{Parse multibook, multiverse bible references of the form: Acts 1:1-10; Eph 1:5-10; John 12:4}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ["lib/acts_as_scriptural.rb", 
                        "lib/acts_as_scriptural/book.rb",
                        "lib/acts_as_scriptural/parser.rb",
                        "lib/acts_as_scriptural/bible.rb",
                        "lib/acts_as_scriptural/book.rb",
                        "lib/acts_as_scriptural/parsed_reference.rb",
                        "lib/acts_as_scriptural/abbreviation_lookup.rb",
                        "data/acts_as_scriptural/english.txt"
                        ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", '~> 0'
  spec.add_development_dependency "rspec", '~> 3'
  spec.add_development_dependency 'pry', '~> 0'

end

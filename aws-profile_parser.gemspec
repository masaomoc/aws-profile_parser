# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws/profile_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "aws-profile_parser"
  spec.version       = Aws::ProfileParser::VERSION
  spec.authors       = ["Masao Mochizuki"]
  spec.email         = ["masaomoc.0301988@gmail.com"]
  spec.summary       = %q{Parse AWS CLI $AWS_CONFIG_FILE setting in Ruby}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/masaomoc/aws-profile_parser/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

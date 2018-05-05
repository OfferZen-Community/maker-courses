# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maker/courses/version'

Gem::Specification.new do |spec|
  spec.name          = "maker-courses"
  spec.version       = Maker::Courses::VERSION
  spec.authors       = ["Dan Davey"]
  spec.email         = ["dan@offerzen.com"]

  spec.summary       = %q{Data for Make courses}
  spec.description   = %q{I'll do this later.}
  spec.homepage      = "somewhere.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

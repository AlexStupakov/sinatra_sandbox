lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sinatra_sandbox/version"

Gem::Specification.new do |spec|
  spec.name = 'sinatra_sandbox'
  spec.version = SinatraSandbox::VERSION
  spec.summary = 'Making sinatra app gem'
  spec.date        = '2010-04-28'
  spec.description = "A simple hello world gem"
  spec.authors     = ["AlexStupakov"]
  spec.email       = 'stepan.alex@gmail.com'

  spec.summary       = "test gem"
  spec.description   = "test gem"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "sass", "~> 3.5"
  spec.add_dependency "sinatra", "~> 2.0"
  spec.add_dependency "sinatra-contrib", "~> 2.0"
  spec.add_dependency "slim", "~> 3.0"
  spec.add_dependency "sqlite3", "~> 1.3"
  spec.add_dependency "data_mapper", '~> 0'
  spec.add_dependency "dm-sqlite-adapter", "~> 1.2"

end
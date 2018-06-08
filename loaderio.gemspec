$:.push File.expand_path("../lib", __FILE__)
require "loaderio/version"

Gem::Specification.new do |s|
  s.name        = "loaderio"
  s.version     = Loaderio::VERSION
  s.authors     = ["Olexander Paladiy", "Ryan Her", "Eric Hopkins"]
  s.email       = ["eric@quikly.com"]
  s.homepage    = "http://loader.io/"
  s.summary     = %q{loader.io ruby api client v2}
  s.description = %q{loader.io ruby api client v2}

  s.rubyforge_project = "loaderio"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.12.0"
  s.add_development_dependency "simplecov", "~> 0.7.1"
  s.add_development_dependency "rake", "~> 10.2.2"

  s.add_runtime_dependency "rest-client", "~> 2.0.2"
  s.add_runtime_dependency "multi_json", "~> 1.11.0"
end

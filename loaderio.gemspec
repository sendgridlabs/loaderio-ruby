$:.push File.expand_path("../lib", __FILE__)
require "loaderio/version"

Gem::Specification.new do |s|
  s.name        = "loaderio"
  s.version     = Loaderio::VERSION
  s.authors     = ["paladiy"]
  s.email       = ["olexanderpaladiy@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "loaderio"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.12.0"
  s.add_development_dependency "simplecov", "~> 0.7.1"
  
  s.add_runtime_dependency "rest-client", "~> 1.6.7"
end

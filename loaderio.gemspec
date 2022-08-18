$:.push File.expand_path("../lib", __FILE__)
require "loaderio/version"

Gem::Specification.new do |s|
  s.name        = "loaderio"
  s.version     = Loaderio::VERSION
  s.authors     = ["Olexander Paladiy"]
  s.email       = ["loaderio@labs.sendgrid.com"]
  s.homepage    = "http://loader.io/"
  s.summary     = %q{loader.io ruby api client}
  s.description = %q{loader.io ruby api client}

  s.rubyforge_project = "loaderio"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.12.0"
  s.add_development_dependency "simplecov", "~> 0.7.1"
  s.add_development_dependency "rake", "~> 10.0.3"

  s.add_runtime_dependency "rest-client", "~> 2.0.1"
  s.add_runtime_dependency "multi_json", "~> 1.10.0"
end

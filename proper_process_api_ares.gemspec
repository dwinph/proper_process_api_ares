# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "proper_process_api_ares/version"

Gem::Specification.new do |s|
  s.name        = "proper_process_api_ares"
  s.version     = ProperProcessApiAres::VERSION
  s.authors     = ["Aldwin Ibuna"]
  s.email       = ["aibuna@gmail.com"]
  s.homepage    = "http://aldwinibuna.com"
  s.summary     = %q{API wrapper for Proper Process API using ActiveResource}
  s.description = %q{API wrapper for Proper Process API using ActiveResource}

  s.rubyforge_project = "proper_process_api_ares"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "object_dojo/version"

Gem::Specification.new do |s|
  s.name        = "object_dojo"
  s.version     = ObjectDojo::VERSION
  s.authors     = ["Sathish"]
  s.email       = ["sathish316@gmail.com"]
  s.homepage    = "http://www.github.com/sathish316/object_dojo"
  s.summary     = %q{ObjectDojo is a utility to improve your Object oriented programming skills using rules described in the article "Object Calisthenics" by JeffBay}
  s.description = %q{ObjectDojo is a utility to improve your Object oriented programming skills using rules described in the article "Object Calisthenics" by JeffBay}
  s.rubyforge_project = "object_dojo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hammelin/version"

Gem::Specification.new do |s|
  s.name        = "hammelin"
  s.version     = Hammelin::VERSION
  s.authors     = ["Alvaro Pereyra"]
  s.email       = "alvaro@xendacentral.com"
  s.homepage    = ""
  s.summary     = %q{Hammelin allows you to play around with JFugue MIDI capabilities}
  s.description = %q{Hammelin wraps around JFugue and lets your play with notes, making Ruby sing}

  s.rubyforge_project = "hammelin"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = []
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

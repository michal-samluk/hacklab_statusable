# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hacklab_statusable/version"

Gem::Specification.new do |s|
  s.name = 'hacklab_statusable'
  s.version = HacklabStatusable::VERSION
  s.authors = %w(Michał\ Samluk)
  s.summary = 'Gem created on hacklab.'
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage    = "https://github.com/michal-samluk/hacklab_statusable"
end
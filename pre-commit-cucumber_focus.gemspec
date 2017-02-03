=begin
Copyright 2017 Aleksei Gusev aleksei.gusev@gmail.com

See the file LICENSE for copying permission.
=end

# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pre-commit/cucumber_focus/version'

Gem::Specification.new do |s|
  s.name     = "pre-commit-cucumber_focus"
  s.version  = PreCommit::CucumberFocus::VERSION
  s.author   = "Aleksei Gusev"
  s.email    = "aleksei.gusev@gmail.com"
  s.homepage = "https://github.com/hron/pre-commit-cucumber_focus"
  s.license  = "MIT"
  s.summary  = "Finds cucumber scenarios with with specific tags (e.g. @focus)"

  s.extra_rdoc_files = ["README.md"]
  s.files = Dir["lib/**/*"]

  s.add_dependency("pre-commit")

  s.add_development_dependency("guard", "~> 2.0")
  s.add_development_dependency("guard-minitest", "~> 2.0")
  s.add_development_dependency("minitest", "~> 4.0")
  s.add_development_dependency("minitest-reporters", "~> 0")
  s.add_development_dependency("minitest-around", "~> 0")
  s.add_development_dependency("mocha", "~>1.1")
  s.add_development_dependency("rake", "~> 10.0")
end

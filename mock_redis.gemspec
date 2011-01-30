# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'mock_redis/version'

Gem::Specification.new do |s|
  s.name        = "mock_redis"
  s.version     = MockRedis::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jay Adkisson", "Fernando Blat"]
  s.email       = [""]
  s.homepage    = "http://rubygems.org/gems/mock_redis"
  s.summary     = "A little class that acts like redis-rb, but for testing on machines without redis."
  s.description = "A little class that acts like redis-rb, but for testing on machines without redis."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "mock_redis"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.5"
  s.add_development_dependency "rspec"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end

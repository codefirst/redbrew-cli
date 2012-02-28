# -*- mode:ruby; coding:utf-8 -*-
require File.expand_path('../lib/redbrew/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["mallowlabs"]
  gem.email         = ["mallowlabs@gmail.com"]
  gem.description   = %q{A client application for Redbrew.}
  gem.summary       = %q{A client application for Redbrew.}
  gem.homepage      = "http://redbrew.heroku.com"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "redbrew"
  gem.require_paths = ["lib"]
  gem.version       = Redbrew::VERSION

  # gem.add_dependency 'json', ['>= 0'] unless defined? JSON
  #gem.add_dependency 'subcommand', ['>= 0']
  gem.add_development_dependency 'rspec', ['>= 0']
  gem.add_development_dependency 'rake', ['>= 0']
end

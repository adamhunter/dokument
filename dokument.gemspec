# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dokument/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Hunter"]
  gem.email         = ["adamhunter@me.com"]
  gem.description   = %q{Provides a ripple document to give models 1 or n file attachments.}
  gem.summary       = %q{Riak backed model attachments}
  # gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dokument"
  gem.require_paths = ["lib"]
  gem.version       = Dokument::VERSION

  gem.add_dependency "riak-client", "~> 1.0.3"
  gem.add_development_dependency "rspec", "~> 2.10.0"
end

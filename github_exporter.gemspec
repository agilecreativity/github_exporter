# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_exporter/version'
Gem::Specification.new do |spec|
  spec.name          = 'github_exporter'
  spec.version       = GithubExporter::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = %q{CLI template for GithubExporter}
  spec.description   = %q{The starting template for GithubExporter}
  spec.homepage      = 'https://github.com/agilecreativity/github_exporter'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_development_dependency 'awesome_print', '~> 1.2'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'guard', '~> 2.6'
  spec.add_development_dependency 'guard-minitest', '~> 2.2'
  spec.add_development_dependency 'minitest', '~> 5.3'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0.3'
  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rubocop', '~> 0.20'
  spec.add_development_dependency 'yard', '~> 0.8'
end

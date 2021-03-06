# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github_exporter/version"
Gem::Specification.new do |spec|
  spec.name          = "github_exporter"
  spec.version       = GithubExporter::VERSION
  spec.authors       = ["Burin Choomnuan"]
  spec.email         = ["agilecreativity@gmail.com"]
  spec.summary       = %q(Export any project from Github or a local project directory to a single pdf file)
  spec.description   = %q{Export any project from Github (or a local directory) to a single pdf file.
                          Combine useful features of the following ruby gems
                          (vim_printer, html2pdf, pdfs2pdf and others)
                          to produce a single pdf file for quick review.
                         }
  spec.homepage      = "https://github.com/agilecreativity/github_exporter"
  spec.license       = "MIT"
  spec.files         = Dir.glob("{bin,lib,templates}/**/*") + %w[Gemfile
                                                                 Rakefile
                                                                 github_exporter.gemspec
                                                                 README.md
                                                                 CHANGELOG.md
                                                                 LICENSE
                                                                 .rubocop.yml
                                                                 .gitignore]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "thor", "~> 0.19"
  spec.add_runtime_dependency "git", "~> 1.2"
  spec.add_runtime_dependency "awesome_print", "~> 1.2"
  spec.add_runtime_dependency "agile_utils", "~> 0.1.4"
  spec.add_runtime_dependency "code_lister", "~> 0.1.7"
  spec.add_runtime_dependency "vim_printer", "~> 0.1.12"
  spec.add_runtime_dependency "html2pdf", "~> 0.1.7"
  spec.add_runtime_dependency "pdfs2pdf", "~> 0.1.6"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "gem-ctags", "~> 1.0"
  spec.add_development_dependency "guard", "~> 2.6"
  spec.add_development_dependency "guard-minitest", "~> 2.2"
  spec.add_development_dependency "minitest", "~> 5.3"
  spec.add_development_dependency "minitest-spec-context", "~> 0.0.3"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "pry-theme"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rubocop", "~> 0.23"
  spec.add_development_dependency "yard", "~> 0.8"
end

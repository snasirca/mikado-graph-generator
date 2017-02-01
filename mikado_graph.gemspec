# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mikado_graph/version"

Gem::Specification.new do |spec|
  spec.name          = "mikado_graph_generator"
  spec.version       = MikadoGraph::VERSION
  spec.authors       = ["Shahriyar Nasir"]
  spec.email         = ["contact@snasir.ca"]

  spec.summary       = "Mikado Graph generator"
  spec.description   = "Provides a simple DSL for generating Mikado Graphs using GraphViz."
  spec.homepage      = "https://github.com/snasirca/mikado_graph_generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

lib = File.expand_path("lib", __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mikado_graph/version"

Gem::Specification.new do |spec|
  spec.name = "mikado_graph_generator"
  spec.version = MikadoGraph::VERSION
  spec.authors = ["Shahriyar Nasir"]
  spec.email = ["contact@snasir.ca"]

  spec.summary = "Mikado Graph generator"
  spec.description = "Provides a simple DSL for generating Mikado Graphs using GraphViz."
  spec.homepage = "https://github.com/snasirca/mikado_graph_generator"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.5"
  spec.add_runtime_dependency "ruby-graphviz", "~> 1.2"

  spec.add_development_dependency "bump", "~> 0.10"
  spec.add_development_dependency "rake", "~> 13.1"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.58"
  spec.add_development_dependency "standard", "~> 1.33"
  spec.add_development_dependency "standardrb", "~> 1.0"
  spec.add_development_dependency "rubocop-rspec", "~> 3.6"
  spec.add_development_dependency "rubocop-rake", "~> 0.6"

  spec.requirements << "GraphViz (https://graphviz.org)"
end

require "mikado_graph"

MikadoGraph::Generator.define do
  state("State A").with_prerequisites do
    state("State B").with_prerequisites do
      state("State D")
      state("State E")
    end
    state("State C").with_prerequisites do
      state("State F")
      state("State G")
    end
  end
end.generate(format: "png", path: "img/example_usage_horizontal.png", direction: :horizontal)

require "mikado_graph"

MikadoGraph::Generator.define do
  state("State A").depends_on {
    state("State B").depends_on {
      state("State D")
      state("State E")
    }
    state("State C").depends_on {
      state("State F")
      state("State G")
    }
  }
end.generate("png", "img/example_usage.png")

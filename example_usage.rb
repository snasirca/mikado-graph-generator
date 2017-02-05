require "mikado_graph"

MikadoGraph::Generator.define do
  state("State A").depends_on do
    state("State B").depends_on do
      state("State D")
      state("State E")
    end
    state("State C").depends_on do
      state("State F")
      state("State G")
    end
  end
end.generate("png", "img/example_usage.png")

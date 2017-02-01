#!/usr/bin/env ruby

require "mikado_graph"

MikadoGraph::Generator.generate do
  state("State A").depends_on do
    state("State B")
    state("State C")
  end
end

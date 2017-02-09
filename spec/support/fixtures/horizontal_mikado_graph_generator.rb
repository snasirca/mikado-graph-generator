#!/usr/bin/env ruby

require "mikado_graph"

MikadoGraph::Generator.define do
  state("State A").depends_on do
    state("State B")
    state("State C")
  end
end.generate(direction: :horizontal)

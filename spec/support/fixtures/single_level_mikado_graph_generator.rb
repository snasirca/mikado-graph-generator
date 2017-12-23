#!/usr/bin/env ruby

require "mikado_graph"

MikadoGraph::Generator.define do
  state("State A").with_prerequisites do
    state("State B")
    state("State C")
  end
end.generate

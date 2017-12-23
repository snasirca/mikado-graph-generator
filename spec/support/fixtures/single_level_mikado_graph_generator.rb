#!/usr/bin/env ruby

require "mikado_graph"

MikadoGraph::Generator.define do
  state("A").with_prerequisites do
    state("B")
    state("C")
  end
end.generate

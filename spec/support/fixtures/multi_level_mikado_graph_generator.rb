#!/usr/bin/env ruby

require "mikado_graph"

MikadoGraph::Generator.define do
  state("A").with_prerequisites do
    state("B").with_prerequisites do
      state("D")
      state("E")
    end
    state("C").with_prerequisites do
      state("F")
      state("G")
    end
  end
end.generate

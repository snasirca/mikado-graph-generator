require "graphviz"

module MikadoGraph
  class Generator
    attr_reader :dependencies, :graph

    def self.define(&block)
      generator_instance = new
      generator_instance.dependencies.instance_eval(&block)
      generator_instance
    end

    def generate(format = "dot", path = nil)
      add_states_to_graph(dependencies.dependent_states)
      output_options = {}
      output_options[format] = path
      graph.output(output_options)
    end

    private

    def initialize
      @dependencies = Dependencies.new
      initialize_graph
    end

    def initialize_graph
      @graph = GraphViz.new(nil)
      @graph[:rankdir] = "LR"
      @graph.node[:shape] = "box"
    end

    def add_states_to_graph(states)
      states.each { |state| add_state_dependencies(state) }
    end

    def add_state_dependencies(state)
      state.dependent_states.each do |dependent_state|
        add_dependency(state, dependent_state)
        add_state_dependencies(dependent_state)
      end
    end

    def add_dependency(state, dependent_state)
      state_node = graph.add_nodes(state.name)
      dependent_state_node = graph.add_nodes(dependent_state.name)
      graph.add_edges(dependent_state_node, state_node)
    end
  end
end

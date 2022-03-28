module MikadoGraph
  class State
    attr_reader :name, :prerequisite_states

    def initialize(name)
      @name = name
      @prerequisite_states = []
    end

    def with_prerequisites(&block)
      prerequisites = Prerequisites.new
      prerequisites.instance_eval(&block)
      @prerequisite_states = prerequisites.states
    end

    alias_method :with_prereqs, :with_prerequisites

    def to_s
      name
    end
  end
end

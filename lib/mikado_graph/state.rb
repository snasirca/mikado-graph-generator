module MikadoGraph
  class State
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def depends_on(&block)
      dependencies = Dependencies.new
      dependencies.instance_eval(&block)
      @dependent_states = dependencies.dependent_states
    end

    def dependent_states
      @dependent_states || []
    end

    def to_s
      name
    end
  end
end

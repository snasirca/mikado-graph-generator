module MikadoGraph
  class Dependencies
    attr_reader :dependent_states

    def initialize
      @dependent_states = []
    end

    def state(state_name)
      new_state = State.new(state_name)
      dependent_states << new_state
      new_state
    end
  end
end

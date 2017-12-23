module MikadoGraph
  class Prerequisites
    attr_reader :states

    def initialize
      @states = []
    end

    def state(state_name)
      new_state = State.new(state_name)
      states << new_state
      new_state
    end
  end
end

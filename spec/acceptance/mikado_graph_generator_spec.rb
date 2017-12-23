require "open3"

RSpec.describe "mikado graph generator" do
  describe "when converting to graphviz" do
    it "converts single level of dependencies" do
      output, status = run_tool_using("single_level_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to include(
        "shape=box",
        'A -> B',
        'A -> C'
      )
    end

    it "converts into a horizontal graph" do
      output, status = run_tool_using("horizontal_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to include(
        "shape=box",
        "rankdir=LR",
        'A -> B',
        'A -> C'
      )
    end

    it "converts multiple levels of dependencies" do
      output, status = run_tool_using("multi_level_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to include(
        "shape=box",
        'A -> B',
        'B -> D',
        'B -> E',
        'A -> C',
        'C -> F',
        'C -> G'
      )
    end
  end

  private

  def run_tool_using(mikado_graph_generator_definition)
    Open3.capture2("spec/support/fixtures/#{mikado_graph_generator_definition}")
  end

  def did_not_error(status)
    expect(status.exitstatus).to eq(0)
  end
end

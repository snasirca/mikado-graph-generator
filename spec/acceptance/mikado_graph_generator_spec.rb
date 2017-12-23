require "open3"

RSpec.describe "mikado graph generator" do
  describe "when converting to graphviz" do
    it "converts single level of dependencies" do
      output, status = run_tool_using("single_level_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to include(
        "shape=box",
        '"State A" -> "State B"',
        '"State A" -> "State C"'
      )
    end

    it "converts into a horizontal graph" do
      output, status = run_tool_using("horizontal_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to include(
        "shape=box",
        "rankdir=LR",
        '"State A" -> "State B"',
        '"State A" -> "State C"'
      )
    end

    it "converts multiple levels of dependencies" do
      output, status = run_tool_using("multi_level_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to include(
        "shape=box",
        '"State A" -> "State B"',
        '"State B" -> "State D"',
        '"State B" -> "State E"',
        '"State A" -> "State C"',
        '"State C" -> "State F"',
        '"State C" -> "State G"'
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

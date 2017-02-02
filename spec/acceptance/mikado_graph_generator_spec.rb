require "rspec"
require "open3"

describe "mikado graph generator" do
  describe "when converting to graphviz" do
    it "converts single level of dependencies" do
      output, status = run_tool_using("spec/fixtures/single_level_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to match("shape=box")
      expect(output).to match("rankdir=LR")
      expect(output).to match("\"State B\" -> \"State A\"")
      expect(output).to match("\"State C\" -> \"State A\"")
    end

    it "converts multiple levels of dependencies" do
      output, status = run_tool_using("spec/fixtures/multi_level_mikado_graph_generator.rb")

      did_not_error(status)
      expect(output).to match("shape=box")
      expect(output).to match("rankdir=LR")
      expect(output).to match("\"State B\" -> \"State A\"")
      expect(output).to match("\"State D\" -> \"State B\"")
      expect(output).to match("\"State E\" -> \"State B\"")
      expect(output).to match("\"State C\" -> \"State A\"")
      expect(output).to match("\"State F\" -> \"State C\"")
      expect(output).to match("\"State G\" -> \"State C\"")
    end
  end

  private

  def run_tool_using(cmd)
    Open3.capture2(cmd)
  end

  def did_not_error(status)
    expect(status.exitstatus).to eq(0)
  end
end

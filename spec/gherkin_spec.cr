require "./spec_helper"

describe Gherkin do
  it "works" do
    feature = Gherkin.from_file("#{File.dirname(__FILE__)}/fixtures/example.feature")
    feature.title.should eq("Example feature")
    feature.description.should eq("Example description")
    feature.scenarios.size.should eq(1)
    scenario = feature.scenarios[0]
    scenario.title.should eq("Example scenario")
    scenario.steps.size.should eq(3)
  end
end

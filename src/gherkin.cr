require "./gherkin/parser"
module Gherkin
  VERSION = "0.1.0"

  def self.from_file(path : String)
    parse File.read(path)
  end

  def self.parse(content : String)
    Parser.new(content).parse
  end
end

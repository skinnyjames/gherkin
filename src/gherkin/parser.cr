require "string_scanner"

module Gherkin
  module Ast

    class Step 
      def initialize(@text : String)
      end
    end

    class Scenario
      getter :title
      property :steps
      def initialize(@title : String)
        @steps = [] of Step
      end
    end

    class Feature
      getter :title
      property :scenarios, :description
      
      @description : String? = nil

      def initialize(@title : String)
        @scenarios = [] of Scenario
      end
    end

    class Document
    end
  end

  class Parser
    def initialize(str : String, *, @scanner = StringScanner.new(str))
    end

    def parse
      match_feature
    end

    private def match_feature
      @scanner.scan(/Feature: (.*)/)
      Ast::Feature.new(@scanner[1])
    end
  end
end
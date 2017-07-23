require "ruby_parser"

module OSHA
  class RubyFile
    PROCESSOR = RubyParser.new

    def initialize(file_path)
      @file_path = file_path
      @sexp = PROCESSOR.parse(File.read(file_path))
    end

    def apply_rule(rule)
      @sexp.deep_each do |sexp|
        rule.run(sexp)
      end
    end
  end
end

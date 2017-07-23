require "ruby_parser"

module OSHA
  class RubyFile
    PROCESSOR = RubyParser.new

    def initialize(file_path)
      @file_path = file_path
      @sexp = PROCESSOR.parse(File.read(file_path), file_path)
    end

    def apply_rules(rules)
      warnings = @sexp.deep_each.flat_map do |sexp|
        rules.map do |rule|
          rule.run(sexp)
        end
      end

      warnings.compact
    end
  end
end

eval("'hello'")

require 'spec_helper'

RSpec.describe OSHA::Rule::Eval do
  describe "eval is found in sexp tree" do
    it "creates warning if eval is found in sexp" do
      sexp = RubyParser.new.parse("eval('puts 1')")

      warning = OSHA::Rule::Eval.new.run(sexp)

      expect(warning.message).to eq("Use of eval")
      expect(warning.sexp).to eq(sexp)
    end
  end

  describe "eval is not found in sexp tree" do
    it "returns nil" do
      sexp = RubyParser.new.parse("puts 1")

      warning = OSHA::Rule::Eval.new.run(sexp)

      expect(warning).to be_nil
    end
  end
end

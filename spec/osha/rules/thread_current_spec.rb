require 'spec_helper'

RSpec.describe OSHA::Rule::ThreadCurrent do
  describe "Thread.current found in sexp tree" do
    it "creates warning" do
      sexp = RubyParser.new.parse("Thread.current[:id]")

      warning = OSHA::Rule::ThreadCurrent.new.run(sexp)

      expect(warning.message).to eq("Use of Thread.current")
      expect(warning.sexp).to eq(sexp)
    end
  end

  describe "Thread.current is not found in sexp tree" do
    it "returns nil" do
      sexp = RubyParser.new.parse("puts 1")

      warning = OSHA::Rule::Eval.new.run(sexp)

      expect(warning).to be_nil
    end
  end
end

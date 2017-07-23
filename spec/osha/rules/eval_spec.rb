require 'spec_helper'

RSpec.describe OSHA::Rule::Eval do
  it "warns if eval is found in sexp" do
    sexp = RubyParser.new.parse("eval('puts 1')")

    expect{
      OSHA::Rule::Eval.new.run(sexp)
    }.to output("DO NOT CALL EVAL\n").to_stdout
  end
end

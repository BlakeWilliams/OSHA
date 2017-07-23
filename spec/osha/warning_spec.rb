require 'spec_helper'

RSpec.describe OSHA::Warning do
  describe "#line" do
    it "delegetes to sexp" do
      sexp = double(:sexp, line: 1)

      warning = OSHA::Warning.new("Use of eval", sexp)

      expect(warning.line).to eq(1)
    end
  end

  describe "#file" do
    it "delegetes to sexp" do
      sexp = double(:sexp, file: "foo.rb")

      warning = OSHA::Warning.new("Use of eval", sexp)

      expect(warning.file).to eq("foo.rb")
    end
  end
end

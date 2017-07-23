require 'spec_helper'

RSpec.describe OSHA::Formatter::TextFormatter do
  describe "print" do
    it "prints warning and line in violation of rule" do
      file = Tempfile.new('foo.rb')
      file.write <<-FILE
if true
  puts "Hello!"
end
      FILE
      file.close
      sexp = RubyParser.new.parse(File.read(file.path), file.path)
      warning = OSHA::Warning.new("Use of eval", sexp)
      formatter = OSHA::Formatter::TextFormatter.new

      expect{
        formatter.print(warning)
      }.to output("Use of eval at #{file.path}:1\n> if true\n").to_stdout
    end
  end
end

require 'spec_helper'
require 'tempfile'

RSpec.describe OSHA::RubyFile do
  describe '#apply_rules' do
    it "returns a list of warnings" do
      file = Tempfile.new('foo.rb')
      file.write <<-FILE
      if true
        puts "Hello!"
      end
      FILE
      file.close
      ruby_file = OSHA::RubyFile.new(file.path)

      warnings = ruby_file.apply_rules([TestRule.new])

      expect(warnings.length).to eq(3)
    end

    it "runs multiple rules" do
      file = Tempfile.new('foo.rb')
      file.write <<-FILE
      if true
        puts "Hello!"
      end
      FILE
      file.close
      ruby_file = OSHA::RubyFile.new(file.path)

      warnings = ruby_file.apply_rules([TestRule.new, TestRule.new])

      expect(warnings.length).to eq(6)
    end

    it "filters out nils" do
      file = Tempfile.new('foo.rb')
      file.write <<-FILE
      if true
        puts "Hello!"
      end
      FILE
      file.close
      ruby_file = OSHA::RubyFile.new(file.path)

      warnings = ruby_file.apply_rules([TestRule.new, NilRule.new])

      expect(warnings.length).to eq(3)
    end

    it "does not crash on empty files" do
      file = Tempfile.new('foo.rb')
      file.write <<-FILE
      FILE
      file.close
      ruby_file = OSHA::RubyFile.new(file.path)

      warnings = ruby_file.apply_rules([TestRule.new, NilRule.new])

      expect(warnings).to eq([])
    end
  end

  class TestRule < OSHA::Rule::Rule
    def run(sexp)
      create_warning("test", sexp)
    end
  end

  class NilRule < OSHA::Rule::Rule
    def run(sexp)
    end
  end
end

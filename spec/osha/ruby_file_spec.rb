require 'spec_helper'
require 'tempfile'

RSpec.describe OSHA::RubyFile do
  describe '#apply_rule' do
    it "calls run on each passed in rule" do
      file = Tempfile.new('foo.rb')
      file.write <<-FILE
      if true
        puts "Hello!"
      end
      FILE
      file.close
      ruby_file = OSHA::RubyFile.new(file.path)

      mock = double(:caller)
      allow(mock).to receive(:call)
      rule = TestRule.new(mock)

      ruby_file.apply_rule(rule)

      expect(mock).to have_received(:call).with(s(:true)).once
      expect(mock).to have_received(:call).with(
        s(:call, nil, :puts, s(:str, "Hello!"))).once
      expect(mock).to have_received(:call).with(s(:str, "Hello!")).once
    end
  end

  class TestRule
    def initialize(mock)
      @mock = mock
    end

    def run(sexp)
      @mock.call(sexp)
    end
  end
end

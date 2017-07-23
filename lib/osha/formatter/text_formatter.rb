module OSHA::Formatter
  class TextFormatter
    def print(warning)
      puts "#{warning.message} at #{warning.file}:#{warning.line}"
      puts "> #{get_source_line(warning)}"
    end

    private

    def get_source_line(warning)
      File.open(warning.file) do |file|
        (warning.line - 1).times { file.gets }
        file.gets
      end
    end
  end
end

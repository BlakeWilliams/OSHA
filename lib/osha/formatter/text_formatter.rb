module OSHA::Formatter
  class TextFormatter
    def print(warning)
      puts "#{warning.message} at #{warning.sexp.file}:#{warning.sexp.line}"
      puts "> #{get_source_line(warning)}"
    end

    private

    def get_source_line(warning)
      File.open(warning.sexp.file) do |file|
        (warning.sexp.line - 1).times { file.gets }
        file.gets
      end
    end
  end
end

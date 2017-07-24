module OSHA::Rule
  class ThreadCurrent < Rule
    def run(sexp)
      if sexp[1] == s(:call, s(:const, :Thread), :current)
        create_warning("Use of Thread.current", sexp)
      end
    end
  end
end

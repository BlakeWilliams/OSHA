module OSHA::Rule
  class Eval < Rule
    def run(sexp)
      if sexp.sexp_type == :call && sexp[2] == :eval
        create_warning("Use of eval", sexp)
      end
    end
  end
end

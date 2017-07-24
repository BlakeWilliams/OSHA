module OSHA::Rule
  class Eval < Rule
    def run(sexp)
      return unless sexp.sexp_type == :call

      if (sexp[1] == nil || sexp[1][1] == :Kernel) && sexp[2] == :eval
        create_warning("Use of eval", sexp)
      elsif sexp[2] == :instance_eval
        create_warning("Use of instance_eval", sexp)
      end
    end
  end
end

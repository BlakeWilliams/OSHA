module OSHA::Rule
  class Eval < Rule
    def run(sexp)
      return unless sexp.sexp_type == :call

      case sexp[2]
      when :eval
        create_warning("Use of eval", sexp)
      when :instance_eval
        create_warning("Use of instance_eval", sexp)
      else
        nil
      end
    end
  end
end

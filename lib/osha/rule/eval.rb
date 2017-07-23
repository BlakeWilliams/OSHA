module OSHA
  module Rule
    class Eval
      def run(sexp)
        if sexp.sexp_type == :call && sexp[2] == :eval
          puts "DO NOT CALL EVAL"
        end
      end
    end
  end
end

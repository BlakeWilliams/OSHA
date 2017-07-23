module OSHA::Rule
  class Rule
    private

    def create_warning(message, sexp)
      OSHA::Warning.new(message, sexp)
    end
  end
end

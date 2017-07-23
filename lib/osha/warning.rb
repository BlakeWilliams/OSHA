
module OSHA
  class Warning
    attr_reader :message, :sexp

    def initialize(message, sexp)
      @message = message
      @sexp = sexp
    end

    def line
      @sexp.line
    end

    def file
      @sexp.file
    end
  end
end

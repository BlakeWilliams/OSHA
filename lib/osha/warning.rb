module OSHA
  class Warning
    attr_reader :message, :sexp

    def initialize(message, sexp)
      @message = message
      @sexp = sexp
    end
  end
end

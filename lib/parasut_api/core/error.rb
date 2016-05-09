class ParasutApi
  module Core
    class Error < StandardError
      attr_reader :code, :description

      def initialize code, description
        @code         = code
        @description  = description
      end

      def message
        "[#{code}] #{description}"
      end
    end
  end
end
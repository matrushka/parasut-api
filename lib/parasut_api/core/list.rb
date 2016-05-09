class ParasutApi
  module Core
    class List < Array
      attr_reader :meta

      def initialize array, meta = {}
        @meta = meta.symbolize_keys
        super(array)
      end
    end
  end
end
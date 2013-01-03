module BlueConductor
  module RecordFor
    class Sanitizer
      UNWANTED_CHARS = %r([^a-zA-Z0-9])

      attr_reader :band, :title

      def initialize(producer)
        @band = producer.band
        @title = producer.title
      end

      def clean
        @band = strip(@band)
        @title = strip(@title)
      end

      def strip(str)
        str.downcase.gsub(UNWANTED_CHARS, "-")
      end
    end
  end
end

module BlueConductor
  module SongFor
    class Sanitizer
      UNWANTED_CHARS = %r([^a-zA-Z0-9])

      attr_reader :band, :song

      def initialize(manager)
        @band = manager.band
        @song = manager.song
      end

      def clean
        @band = strip(@band)
        @song = strip(@song)
      end

      def strip(str)
        str.downcase.gsub(UNWANTED_CHARS, "-")
      end
    end
  end
end

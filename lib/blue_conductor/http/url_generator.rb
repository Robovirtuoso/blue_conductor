module BlueConductor
  module HTTP
    class UrlGenerator
      BASE_URI = "http://www.songlyrics.com/"

      def self.generate(manager)
        sanitizer = BlueConductor::Sanitizer.new(manager)
        sanitizer.clean

        "#{BASE_URI}#{sanitizer.band}/#{sanitizer.song}-lyrics/"
      end
    end
  end
end

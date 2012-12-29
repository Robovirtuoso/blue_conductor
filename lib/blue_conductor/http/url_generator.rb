module BlueConductor
  module HTTP
    class UrlGenerator
      BASE_URI = "http://www.azlyrics.com/lyrics/"

      def self.generate(manager)
        sanitizer = BlueConductor::Sanitizer.new(manager)
        sanitizer.clean

        "#{BASE_URI}#{sanitizer.band}/#{sanitizer.song}.html"
      end
    end
  end
end

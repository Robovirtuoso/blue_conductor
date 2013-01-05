module BlueConductor
  module HTTP
    module Record
      class UrlGenerator
        BASE_URI = "http://www.songlyrics.com/"

        def self.generate(producer)
          sanitizer = BlueConductor::HTTP::Record::Sanitizer.new(producer)
          sanitizer.clean

          "#{BASE_URI}#{sanitizer.band}/#{sanitizer.title}/"
        end
      end
    end
  end
end

require_relative 'sanitizer'

module BlueConductor
  module URL
    class UrlGenerator
      include Sanitizer
      BASE_URI = "http://www.songlyrics.com"

      attr_reader :url

      def initialize(object, type)
        @band  = sanitize(object.band)
        @music = sanitize(object.data)

        path = {
          :song  => "#{BASE_URI}/#{@band}/#{@music}-lyrics",
          :album => "#{BASE_URI}/#{@band}/#{@music}"
        }

        @url = path[type.to_sym]
      end
    end
  end
end

module BlueConductor
  module HTTP
    class Request

      def self.fetch(url)
        Net::HTTP.get(URI.parse(url))
      end
    end
  end
end

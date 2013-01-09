module BlueConductor
  module HTTP
    class Request

      def self.fetch(url)
        response = Net::HTTP.get_response(URI.parse(url))

        if response.code == '301'
          parse(response['location'])
        else
          parse(url)
        end
      end

      def self.parse(location)
        Net::HTTP.get(URI.parse(location))
      end
    end
  end
end

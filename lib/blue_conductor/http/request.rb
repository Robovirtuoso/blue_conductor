module BlueConductor
  module HTTP
    class Request

      def self.fetch(url)
        response = Net::HTTP.get_response(URI.parse(url))

        if response.code == '301'
          fetch(response['location'])
        else
          response.body
        end
      end
    end
  end
end

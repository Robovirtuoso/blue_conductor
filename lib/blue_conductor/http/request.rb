module BlueConductor
  module HTTP
    class Request

      def self.fetch(url)
        begin
          open(url)
        rescue OpenURI::HTTPError
          nil
        end
      end
    end
  end
end

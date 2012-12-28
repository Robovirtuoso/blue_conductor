module Conductor
  module HTTP
    class Request

      def self.fetch(url)
        begin
          open(url)
        rescue OpenURI::HTTPError => e
          nil
        end
      end
    end
  end
end

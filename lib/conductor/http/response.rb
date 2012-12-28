module Conductor
  module HTTP
    class Response

      def self.parse(html)
        doc = Nokogiri::HTML(html)
        doc.css('div#main div')[3].text
      end
    end
  end
end

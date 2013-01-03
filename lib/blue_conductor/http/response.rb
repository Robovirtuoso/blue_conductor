module BlueConductor
  module HTTP
    class Response

      def self.parse(html)
        doc = Nokogiri::HTML(html)
        doc.css('p#songLyricsDiv').text
      end
    end
  end
end

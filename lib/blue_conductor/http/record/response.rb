module BlueConductor
  module HTTP
    module Record
      class Response

        def self.parse(html)
          doc = Nokogiri::HTML(html)
          doc.css('.rightcol .tracklist td a').map(&:text)
        end
      end
    end
  end
end

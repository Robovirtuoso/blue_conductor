module BlueConductor
  module HTTP
    module Record
      class Response

        def self.parse(html)
          doc = Nokogiri::HTML(html)
          doc.css('.rightcol .tracklist td a').map(&:text)
        end

        def self.parse_image(html)
          doc = Nokogiri::HTML(html)
          doc.css('.leftcol img')[0]['src']
        end
      end
    end
  end
end


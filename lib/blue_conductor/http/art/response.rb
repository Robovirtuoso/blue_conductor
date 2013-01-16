module BlueConductor
  module HTTP
    module Art
      class Response

        def self.parse(html)
          doc = Nokogiri::HTML(html)
          doc.css('.leftcol img')[0]['src']
        end
      end
    end
  end
end

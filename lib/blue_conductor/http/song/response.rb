module BlueConductor
  module HTTP
    module Song
      class Response

        def self.data(html)
          doc = Nokogiri::HTML(html)
          doc.css('p#songLyricsDiv').text
        end

        def self.album(html)
          doc = Nokogiri::HTML(html)
          begin
            doc.css('div.pagetitle a')[1].text
          rescue
            'Album Missing'
          end
        end
      end
    end
  end
end

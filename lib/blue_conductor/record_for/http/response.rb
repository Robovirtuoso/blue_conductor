module BlueConductor
  module RecordFor
    module HTTP
      class Response

        def self.parse(html)
          doc = Nokogiri::HTML(html)
          doc.css('.rightcol .tracklist td a').map do |track|
            track.text
          end
        end
      end
    end
  end
end

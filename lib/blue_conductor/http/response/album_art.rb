module BlueConductor
  module HTTP
    module Response
      class AlbumArt

        def initialize(doc)
          @doc = doc
        end

        def parse
          @doc.css('.leftcol img')[0]['src']
        end
      end
    end
  end
end

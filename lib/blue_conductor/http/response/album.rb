module BlueConductor
  module HTTP
    module Response
      class Album

        def initialize(doc)
          @doc = doc
        end

        def parse
          @doc.css('.rightcol .tracklist td a').map(&:text)
        end
      end
    end
  end
end

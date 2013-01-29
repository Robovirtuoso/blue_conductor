module BlueConductor
  module HTTP
    module Response
      class Song

        def initialize(doc)
          @doc = doc
        end

        def parse
          { lyrics: lyrics, album_title: album }
        end

        private

        def lyrics
          @doc.css('p#songLyricsDiv').text
        end

        def album
          if (lyrics = @doc.css('div.pagetitle a')[1]).nil?
            'Album for the requested song does not exist'
          else
            lyrics.text
          end
        end
      end
    end
  end
end

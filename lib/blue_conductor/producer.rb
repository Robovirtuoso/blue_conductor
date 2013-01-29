module BlueConductor
  class Producer
    attr_reader :band, :album, :songs, :image, :error

    def initialize(band, record_title)
      @band     = band
      @album    = record_title
      @songs    = nil
      @image    = ''
      @error    = ''

      url       = URL::UrlGenerator.new(self, :album).url
      html      = HTTP::Request.fetch(url)
      tracklist = HTTP::Response::Responder.parse(html, HTTP::Response::Album)

      if tracklist.nil? || tracklist.empty?
        @error  = 'The album requested is not available || there was a spelling error'
      else
        @image  = HTTP::Response::Responder.parse(html, HTTP::Response::AlbumArt)

        @songs  = tracklist.map do |song|
          BlueConductor.song_for(@band, song)
        end
      end
    end

    def data
      album
    end
  end
end

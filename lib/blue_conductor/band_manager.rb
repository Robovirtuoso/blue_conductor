module BlueConductor
  class BandManager
    attr_reader :band, :song, :lyrics, :album

    def initialize(band, song)
      @band     = band
      @song     = song
    end

    def create_song
      url       = URL::UrlGenerator.new(self, :song).url
      html      = HTTP::Request.fetch(url)
      song_data = HTTP::Response::Responder.parse(html, HTTP::Response::Song)

      @lyrics   = song_data[:lyrics]
      @album    = song_data[:album_title]

      Song.new(self)
    end

    def data
      song
    end
  end
end

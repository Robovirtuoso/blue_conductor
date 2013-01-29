module BlueConductor
  class Designer
    attr_reader :image, :band, :album

    def initialize(band, album)
      @band   = band
      @album  = album

      url     = URL::UrlGenerator.new(self, :album).url
      html    = HTTP::Request.fetch(url)

      @image  = HTTP::Response::Responder.parse(html, HTTP::Response::AlbumArt)
    end

    def data
      album
    end
  end
end

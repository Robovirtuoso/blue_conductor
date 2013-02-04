module BlueConductor
  class Producer
    attr_reader :band, :album, :tracklist, :image, :error

    def initialize(band, record_title)
      @band          = band
      @album         = record_title
      @image         = ''
      @error         = ''

      url        = URL::UrlGenerator.new(self, :album).url
      html       = HTTP::Request.fetch(url)
      @tracklist = HTTP::Response::Responder.parse(html, HTTP::Response::Album)

      if tracklist.nil? || tracklist.empty?
        @error  = 'The album requested is not available || there was a spelling error'
      else
        @image  = HTTP::Response::Responder.parse(html, HTTP::Response::AlbumArt)
      end
    end

    def data
      album
    end
  end
end

module BlueConductor
  class BandManager
    attr_reader :band, :song, :data, :album
    attr_accessor :url_generator, :request, :parser

    def initialize(band, song)
      @band = band
      @song = song
      @album = ''
      @data = ''
    end

    def song!
      url   = url_generator.generate(self)
      html  = request.fetch(url)

      @data = parser.data(html)
      @album = parser.album(html)

      BlueConductor::Song.new(self)
    end
  end
end

module BlueConductor
  class BandManager
    attr_reader :band, :song, :data, :error
    attr_accessor :url_generator, :request, :parser

    def initialize(band, song)
      @band = band
      @song = song
      @error = ''
      @data = ''
    end

    def song!
      url   = url_generator.generate(self)
      html  = request.fetch(url)

      if html
        @data = parser.parse(html)
      else
        @error = 'The band/song does not exist || there was a spelling error'
      end

      BlueConductor::Song.new(self)
    end
  end
end

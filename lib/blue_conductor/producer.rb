module BlueConductor
  class Producer
    attr_reader :band, :title, :songs, :image, :error
    attr_accessor :url_generator, :request, :parser

    def initialize(band, record_title)
      @band = band
      @title = record_title
      @songs = nil
      @image = ''
      @error = ''
    end

    def record!
      url       = url_generator.generate(self)
      html      = request.fetch(url)
      tracklist = parser.parse(html)

      if tracklist.nil? || tracklist.empty?
        @error = 'The album requested is not available || there was a spelling error'
      else
        @image = parser.parse_image(html)

        @songs = tracklist.map do |song|
          BlueConductor.song_for(@band, song)
        end
      end

      self
    end
  end
end

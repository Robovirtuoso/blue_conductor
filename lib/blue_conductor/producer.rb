module BlueConductor
  class Producer
    attr_reader :band, :title, :songs, :error
    attr_accessor :url_generator, :request, :parser

    def initialize(band, record_title)
      @band = band
      @title = record_title
      @songs = []
      @error = ''
    end

    def record!
      url  = url_generator.generate(self)
      html = request.fetch(url)
      tracklist =  parser.parse(html)

      tracklist.each do |song|
        song_object = BlueConductor.song_for(@band, song)
        @songs << song_object
      end

      self
    end
  end
end

module BlueConductor
  class Producer
    attr_reader :band, :title, :songs, :error
    attr_accessor :url_generator

    def initialize(band, record_title)
      @band = band
      @title = record_title
      @songs = []
      @error = ''
    end

    def record!
      url = url_generator.generate(self)
    end
  end
end

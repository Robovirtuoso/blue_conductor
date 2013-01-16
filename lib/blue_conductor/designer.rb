module BlueConductor
  class Designer
    attr_accessor :url_generator, :request, :parser
    attr_reader :image, :band, :title

    def initialize(band, record)
      @band   = band
      @title  = record
    end

    def draw!
      uri    = url_generator.generate(self)
      html   = request.fetch(uri)
      @image = parser.parse(html)

      self
    end
  end
end

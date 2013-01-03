module BlueConductor
  class Song
    attr_accessor :title, :band, :album, :lyrics

    def initialize(manager)
      @title  = manager.song
      @band   = manager.band
      @album  = manager.album
      @lyrics = manager.data
    end
  end
end

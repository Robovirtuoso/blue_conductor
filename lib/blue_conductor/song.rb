module BlueConductor
  class Song
    attr_accessor :title, :band, :album, :lyrics

    def initialize(manager)
      @title  = manager.song
      @band   = manager.band
      @album  = manager.album
      @lyrics = manager.lyrics
    end
  end
end

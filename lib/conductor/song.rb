module Conductor
  class Song
    attr_accessor :title, :band, :lyrics, :error

    def initialize(manager)
      @title  = manager.song
      @band   = manager.band
      @lyrics = manager.data
      @error = manager.error
    end
  end
end

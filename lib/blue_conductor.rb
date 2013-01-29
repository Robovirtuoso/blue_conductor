require 'open-uri'
require 'nokogiri'
require 'net/http'

require_relative 'blue_conductor/version'
require_relative 'blue_conductor/band_manager'
require_relative 'blue_conductor/producer'
require_relative 'blue_conductor/designer'
require_relative 'blue_conductor/song'

require_relative 'blue_conductor/http/request'

require_relative 'blue_conductor/http/response/song'
require_relative 'blue_conductor/http/response/album'
require_relative 'blue_conductor/http/response/album_art'
require_relative 'blue_conductor/http/response/responder'

require_relative 'blue_conductor/url/url_generator'
require_relative 'blue_conductor/url/sanitizer'


module BlueConductor
  def self.song_for(band, song)
    BandManager.new(band, song).create_song
  end

  def self.record_for(band, record_title)
    Producer.new(band, record_title)
  end

  def self.art_for(band, record_title)
    Designer.new(band, record_title)
  end
end

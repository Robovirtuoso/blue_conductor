require 'open-uri'
require 'nokogiri'

require_relative 'blue_conductor/version'
require_relative 'blue_conductor/band_manager'
require_relative 'blue_conductor/song_for/sanitizer'
require_relative 'blue_conductor/song_for/http/request'
require_relative 'blue_conductor/song_for/http/response'
require_relative 'blue_conductor/song_for/http/url_generator'
require_relative 'blue_conductor/song'

module BlueConductor
  def self.song_for(band, song)
    manager               = BlueConductor::BandManager.new(band, song)
    manager.url_generator = BlueConductor::SongFor::HTTP::UrlGenerator
    manager.request       = BlueConductor::SongFor::HTTP::Request
    manager.parser        = BlueConductor::SongFor::HTTP::Response

    manager.song!
  end

  def self.record_for(band, record_title)
    # manager               = BlueConductor::Producer.new(band, record_title).record!
    # manager.url_generator = BlueConductor::HTTP::UrlGenerator
  end
end

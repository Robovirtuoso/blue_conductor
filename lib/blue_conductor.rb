require 'open-uri'
require 'nokogiri'

require_relative 'blue_conductor/version'
require_relative 'blue_conductor/band_manager'
require_relative 'blue_conductor/song_for/sanitizer'
require_relative 'blue_conductor/song_for/http/request'
require_relative 'blue_conductor/song_for/http/response'
require_relative 'blue_conductor/song_for/http/url_generator'
require_relative 'blue_conductor/song'

require_relative 'blue_conductor/producer'
require_relative 'blue_conductor/record_for/sanitizer'
require_relative 'blue_conductor/record_for/http/request'
require_relative 'blue_conductor/record_for/http/response'
require_relative 'blue_conductor/record_for/http/url_generator'


module BlueConductor
  def self.song_for(band, song)
    manager               = BlueConductor::BandManager.new(band, song)
    manager.url_generator = BlueConductor::SongFor::HTTP::UrlGenerator
    manager.request       = BlueConductor::SongFor::HTTP::Request
    manager.parser        = BlueConductor::SongFor::HTTP::Response

    manager.song!
  end

  def self.record_for(band, record_title)
    producer               = BlueConductor::Producer.new(band, record_title).record!
    producer.url_generator = BlueConductor::RecordFor::HTTP::UrlGenerator
    producer.request       = BlueConducter::RecordFor::HTTP::Request
    producer.parser        = BlueConducter::RecordFor::HTTP::Response

    producer.record!
  end
end

require 'open-uri'
require 'nokogiri'
require 'net/http'

require_relative 'blue_conductor/version'
require_relative 'blue_conductor/band_manager'
require_relative 'blue_conductor/producer'
require_relative 'blue_conductor/song'

require_relative 'blue_conductor/http/request'

require_relative 'blue_conductor/http/song/sanitizer'
require_relative 'blue_conductor/http/song/response'
require_relative 'blue_conductor/http/song/url_generator'

require_relative 'blue_conductor/http/record/sanitizer'
require_relative 'blue_conductor/http/record/response'
require_relative 'blue_conductor/http/record/url_generator'


module BlueConductor
  def self.song_for(band, song)
    manager               = BlueConductor::BandManager.new(band, song)
    manager.url_generator = BlueConductor::HTTP::Song::UrlGenerator
    manager.request       = BlueConductor::HTTP::Request
    manager.parser        = BlueConductor::HTTP::Song::Response

    manager.song!
  end

  def self.record_for(band, record_title)
    producer               = BlueConductor::Producer.new(band, record_title)
    producer.url_generator = BlueConductor::HTTP::Record::UrlGenerator
    producer.request       = BlueConductor::HTTP::Request
    producer.parser        = BlueConductor::HTTP::Record::Response

    producer.record!
  end
end

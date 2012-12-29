require 'open-uri'
require 'nokogiri'

require_relative 'blue_conductor/version'
require_relative 'blue_conductor/band_manager'
require_relative 'blue_conductor/sanitizer'
require_relative 'blue_conductor/http/request'
require_relative 'blue_conductor/http/response'
require_relative 'blue_conductor/http/url_generator'
require_relative 'blue_conductor/song'

module BlueConductor
  def self.song_for(band, song)
    manager               = BlueConductor::BandManager.new(band, song)
    manager.url_generator = BlueConductor::HTTP::UrlGenerator
    manager.request       = BlueConductor::HTTP::Request
    manager.parser        = BlueConductor::HTTP::Response

    manager.song!
  end

  def self.record_for(band, record_title)
    # BlueConductor::BandManager.new(band, song).record!
  end
end

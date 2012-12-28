require 'open-uri'
require 'nokogiri'

require_relative "conductor/version"
require_relative "conductor/band_manager"
require_relative 'conductor/sanitizer'
require_relative 'conductor/http/request'
require_relative 'conductor/http/response'
require_relative 'conductor/http/url_generator'
require_relative 'conductor/song'

module Conductor
  def self.song_for(band, song)
    manager               = Conductor::BandManager.new(band, song)
    manager.url_generator = Conductor::HTTP::UrlGenerator
    manager.request       = Conductor::HTTP::Request
    manager.parser        = Conductor::HTTP::Response

    manager.song!
  end

  def self.record_for(band, record_title)
    # Conductor::BandManager.new(band, song).record!
  end
end

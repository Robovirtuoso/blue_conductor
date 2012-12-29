require 'spec_helper'

describe Conductor do
  subject { Conductor }

  let(:band) { 'AC/DC' }
  let(:song) { 'Back in Black' }

  describe '.song_for' do
    it 'returns a song object' do
      VCR.use_cassette 'conductor_song' do
        @track = subject.song_for(band, song)
      end

      @track.band.should == band
      @track.title.should == song
    end
  end
end

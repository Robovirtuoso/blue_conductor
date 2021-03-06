require 'spec_helper'

describe BlueConductor do
  subject { BlueConductor }

  let(:band)  { 'AC/DC' }
  let(:song)  { 'Back in Black' }
  let(:album) { 'Back in Black' }

  describe '.song_for' do
    it 'returns a song object' do
      VCR.use_cassette 'blue_conductor_song' do
        @track = subject.song_for(band, song)
      end

      @track.band.should == band
      @track.title.should == song
    end
  end

  describe '.record_for' do
    it 'returns an array of songs' do
      VCR.use_cassette 'blue_conductor_album' do
        @record = subject.record_for(band, album)
      end

      @record.band.should == band
      @record.title.should == album
      @record.songs.count.should == 14
    end
  end
end

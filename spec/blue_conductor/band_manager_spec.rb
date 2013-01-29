require 'spec_helper'

describe BlueConductor::BandManager do
  subject { BlueConductor::BandManager }

  let(:band)  { 'Van Halen' }
  let(:song)  { 'Unchained' }
  let(:data)  { "Change, nothin' stays the same" }
  let(:album) { 'Fair Warning' }

  describe '.new' do
    context "when the name and band are valid" do
      it 'returns a song object' do
        VCR.use_cassette 'song' do
          @track = subject.new(band, song).create_song
        end

        @track.title.should == song
        @track.band.should == band
        @track.album.should == album
        @track.lyrics.should =~ /#{data}/
      end
    end

    context "when the name and or band are invalid" do
      let(:band) { 'asdf' }
      let(:song) { 'asdf' }

      it 'the error field has content' do
        VCR.use_cassette 'invalid_song' do
          @track = subject.new(band, song).create_song
        end

        @track.lyrics.should =~ /Sorry, we have no/
        @track.album.should =~ /does not exist/
        @track.title.should == song
        @track.band.should == band
      end
    end
  end
end

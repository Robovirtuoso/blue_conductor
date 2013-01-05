require 'spec_helper'

describe BlueConductor::BandManager do
  subject { BlueConductor::BandManager.new(band, song) }

  let(:band) { 'Van Halen' }
  let(:song) { 'Unchained' }
  let(:data) { "Change, nothin' stays the same" }
  let(:album) { 'Fair Warning' }

  before do
    subject.url_generator = BlueConductor::HTTP::Song::UrlGenerator
    subject.request       = BlueConductor::HTTP::Request
    subject.parser        = BlueConductor::HTTP::Song::Response
  end

  describe '.new' do
    it 'creates an instance of itself' do
     subject.band.should == band
      subject.song.should == song
    end
  end

  describe '#song' do
    context "when the name and band are valid" do
      it 'returns a song object' do
        VCR.use_cassette 'song' do
          @track = subject.song!
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
          @track = subject.song!
        end

        @track.lyrics.should =~ /Sorry, we have no/
        @track.album.should =~ /Album Missing/
        @track.title.should == song
        @track.band.should == band
      end
    end
  end
end

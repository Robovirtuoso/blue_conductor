require 'spec_helper'

describe BlueConductor::BandManager do
  subject { BlueConductor::BandManager.new(band, song) }

  let(:band) { 'Van Halen' }
  let(:song) { 'Unchained' }
  let(:data) { "Change, nothin' stays the same" }
  let(:manager_mock) { mock(band: band, song: song, data: data) }
  let(:song_object) { BlueConductor::Song.new(manager_mock) }

  before do
    subject.url_generator = BlueConductor::HTTP::UrlGenerator
    subject.request       = BlueConductor::HTTP::Request
    subject.parser        = BlueConductor::HTTP::Response
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

        @track.error.should =~ /does not exist/
        @track.title.should == song
        @track.band.should == band
      end
    end
  end
end

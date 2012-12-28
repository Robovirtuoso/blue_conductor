require 'spec_helper'

describe Conductor::BandManager do
  subject { Conductor::BandManager.new(band, song) }

  let(:band) { 'The Dear Hunter' }
  let(:song) { 'Red Hands' }
  let(:data) { "Even if you never strayed from me\nI'd question your fidelity" }
  let(:manager_mock) { mock(band: band, song: song, data: data) }
  let(:song_object) { Conductor::Song.new(manager_mock) }

  before do
    subject.url_generator = Conductor::HTTP::UrlGenerator
    subject.request       = Conductor::HTTP::Request
    subject.parser        = Conductor::HTTP::Response
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

require 'spec_helper'

describe BlueConductor::Producer do
  subject { BlueConductor::Producer.new(band, record) }

  let(:band)           { 'Van Halen' }
  let(:record)         { 'Fair Warning' }
  let(:track_list)     { ['Dirty Movies', 'Hear About It Later', 'One Foot Out The Door', 
                          'Push Comes to Shove', "Sinner's Swing", 'So This Is Love?', 
                          'Sunday Afternoon In The Park', 'Unchained', 'Mean Street'
                         ]}

  before do
    subject.url_generator  = BlueConductor::HTTP::Record::UrlGenerator
    subject.request        = BlueConductor::HTTP::Request
    subject.parser         = BlueConductor::HTTP::Record::Response
  end

  describe '.new' do
    it 'creates an instance of itself' do
     subject.band.should == band
      subject.title.should == record
    end
  end

  describe '#record' do
    context 'when the band and record are valid' do
      it 'returns an array of songs' do
        VCR.use_cassette 'full_album' do
          @record = subject.record!
        end

        @record.songs.map(&:title).should == track_list
      end
    end

    context 'when the band and record are invalid' do

      let(:band)   { 'asdf' }
      let(:record) { 'asdf'}

      it 'raises an error' do
        VCR.use_cassette 'invalid_album' do
          @record = subject.record!
        end

          @record.error.should == 'The album requested is not available || there was a spelling error'
          @record.band.should == band
          @record.title.should == record
          @record.songs.should == nil
      end
    end
  end
end

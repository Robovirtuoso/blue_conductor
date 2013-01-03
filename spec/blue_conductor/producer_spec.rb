require 'spec_helper'

describe BlueConductor::Producer do
  subject { BlueConductor::Producer.new(band, record) }

  let(:band) { 'Van Halen' }
  let(:record) { 'Fair Warning' }

  before do
    subject.url_generator  = BlueConductor::RecordFor::HTTP::UrlGenerator
    subject.request        = BlueConductor::RecordFor::HTTP::Request
    subject.parser         = BlueConductor::RecordFor::HTTP::Response
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

        @record.songs.count.should == 9
      end
    end
  end
end

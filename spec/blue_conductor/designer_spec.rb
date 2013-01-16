require 'spec_helper'

describe BlueConductor::Designer do
  subject { BlueConductor::Designer.new(band, record) }

  let(:band)   { 'Van Halen' }
  let(:record) { '1984' }

  before do
    subject.url_generator = BlueConductor::HTTP::Record::UrlGenerator
    subject.request       = BlueConductor::HTTP::Request
    subject.parser        = BlueConductor::HTTP::Art::Response
  end

  it "returns a link to an image" do
    VCR.use_cassette 'album-artwork' do
      @designer = subject.draw!
    end

    @designer.image.should =~ /album_covers/
  end
end

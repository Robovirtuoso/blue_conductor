require 'spec_helper'

describe BlueConductor::Designer do
  subject { BlueConductor::Designer }

  let(:band)  { 'Van Halen' }
  let(:album) { 'Fair Warning' }

  it "returns a link to an image" do
    VCR.use_cassette 'album-artwork' do
      @designer = subject.new(band, album)
    end

    @designer.image.should =~ /album_covers/
  end
end

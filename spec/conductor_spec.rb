require 'spec_helper'

describe Conductor do
  subject { Conductor }

  let(:tracks) { 
    { 'AC/DC' => 'Back in black', 
      'Sly & and the Family Stone' => 'I want to take you higher!',
      '*NSYNC' => 'dirty pop',
      'Florence + the machine' => 'Say My Name'}
    }

  describe '.song_for' do
    it 'returns a song object' do
      tracks.each do |band, song|
        VCR.use_cassette 'conductor_song' do
          @track = subject.song_for(band, song)
        end

        @track.title.should == song
        @track.band.should == band
      end
    end
  end
end

require 'spec_helper'

describe BlueConductor::Producer do
  subject { BlueConductor::Producer }

  let(:band)           { 'Van Halen' }
  let(:record)         { 'Fair Warning' }
  let(:track_list)     { ['Dirty Movies', 'Hear About It Later', 'One Foot Out The Door', 
                          'Push Comes to Shove', "Sinner's Swing", 'So This Is Love?', 
                          'Sunday Afternoon In The Park', 'Unchained', 'Mean Street'
                         ]}


  describe '.new' do
    context 'when the band and record are valid' do
      it 'returns an array of songs' do
        VCR.use_cassette 'full_album' do
          @record = subject.new(band, record)
        end

        @record.tracklist.should == track_list
        @record.image.should == 'http://cdn2.songlyricscom.netdna-cdn.com/album_covers/202/van-halen-fair-warning/van-halen-6832-fair-warning.jpg'
      end
    end

    context 'when the band and record are invalid' do

      let(:band)   { 'asdf' }
      let(:record) { 'asdf'}

      it 'raises an error' do
        VCR.use_cassette 'invalid_album' do
          @record = subject.new(band, record)
        end

          @record.error.should == 'The album requested is not available || there was a spelling error'
          @record.band.should == band
          @record.album.should == record
          @record.tracklist.should == []
          @record.image.should == ''
      end
    end
  end
end

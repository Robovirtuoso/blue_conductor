# BlueConductor

BlueConductor returns an object containing the name, band name and lyrics of a song.

## Installation

Add this line to your application's Gemfile:

    gem 'blue_conductor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blue_conductor

## Usage

Usage is easy. Call .song_for on the BlueConductor object and pass in a band name and song title.

```ruby  
  BlueConductor.song_for('Van Halen', 'Panama')
```


Which will return a BlueConductor::Song object containing the following fields

  * `title`
  * `band`
  * `lyrics`
  * `album`

Calling title or band will return the information that you originally passed in to the BlueConductor. Calling .lyrics will return the lyrics of that song as provided by songlyrics.com. If the lyrics to a song you entered in either do not exist, are not on the songlyrics website or if there was a spelling error, then calling .lyrics will return a string saying 'Sorry we do not have the requested lyrics'. Calling .album will return the album that the song is on.

BlueConductor has a second method called .record_for. Simply pass in the band name and the name of your favorite album and it will return an array of song objects containing the information of each song.

```ruby
  BlueConductor.record_for('Van Halen', '1984')
```

Now, this method returns a BlueConductor::Producer objects that has the following fields on it

  * `title`
  * `band`
  * `songs`
  * `image`
  * `error`

Title and band are obviously set to the values that you pass in. The .songs field though returns an array of BlueConductor::Song objects each with specific information about each song on the album provided. .image contains the image source of the album art and the error field only contains a string if the album/band you provided is not on songlyrics.com.

##CLI

There is a lyrics file providing containing example information on how to use the gem from the terminal.

## Future Installments

A future version of blue_conductor will come with a 'record_for' method that when passed a band name and the name of an album will return an array of song objects containing
the title, band name and lyrics of all the songs on that album.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

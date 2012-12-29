# Conductor

Conductor returns an object containing the name, band name and lyrics of a song.

## Installation

Add this line to your application's Gemfile:

    gem 'conductor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conductor

## Usage

Usage is easy. Call .song_for on the Conductor object and pass in a band name and song title.

```ruby  
  Conductor.song_for('The Dear Hunter', 'The Church and the Dime')
```


Which will return a Conductor::Song object containing the following fields

  * `title`
  * `band`
  * `lyrics`
  * `error`

Calling title or band will return the information that you originally passed in to the Conductor. Calling Conductor::Song.lyrics will return the lyrics of that song as provided by azlyrics.com. If the lyrics to a song you entered in either do not exist, are not on the lyrics website or if there was a spelling error, then calling .lyrics will return a nil object and an error message will be placed in the error field.

##CLI

There is a lyrics file providing containing example information on how to use the gem from the terminal.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

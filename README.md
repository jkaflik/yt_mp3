# YTMp3 [![Build Status](https://secure.travis-ci.org/Kofel/yt_mp3.png)](http://travis-ci.org/Kofel/yt_mp3)

Quickly download video from YouTube to mp3. Sync the folder with playlists or favorites!

## Installation
    $ gem install yt_mp3

## Usage

###Just download
    $ yt_mp3 http://www.youtube.com/watch?v=DYyWVlh8NLM
###Syncing
**syncing user favorites**
    $ yt_mp3 init favorites kofels
    $ yt_mp3 sync
**syncing playlist**
    $ yt_mp3 init playlist 39D3FA44E3F75572
    $ yt_mp3 sync
**and when something has been pushed to playlist type**
    $ yt_mp3 sync

## YouTube MP3 API
This gem was build on top of [YouTube-Mp3.org](http://youtube-mp3.org).

[There I've described an API](https://github.com/Kofel/yt_mp3/wiki/YouTube-MP3-API)

Please note that *yt_mp3* is not responsible for failed conversions. There are limitations ex. 15 convertions for 30 minutes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

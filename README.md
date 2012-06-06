# YTMp3 [![Build Status](https://secure.travis-ci.org/Kofel/yt_mp3.png)](http://travis-ci.org/Kofel/yt_mp3)

Easily download and sync in directory YouTube videos as .mp3 with commandline tool!

## Installation
    $ gem install yt_mp3

## Usage

###Simple download
    $ yt_mp3 http://www.youtube.com/watch?v=DYyWVlh8NLM
###Syncing
Syncing user favorites:
    $ yt_mp3 init favorites PL912D4D7B38309EAA
    $ yt_mp3 sync
Syncing playlist:
    $ yt_mp3 init playlist 39D3FA44E3F75572
    $ yt_mp3 sync

And if playlist or favorites changes type:
    $ yt_mp3 sync

## YouTube MP3 API

This gem was build on top of [YouTube-Mp3.org](http://youtube-mp3.org). Every MP3 file convertion are made by them. [There I've described an API](https://github.com/Kofel/yt_mp3/wiki/YouTube-MP3-API)
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

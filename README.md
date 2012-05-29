# YtMp3

Easily download YouTube videos as Mp3 with commandline tool!

## Installation
    $ gem install yt_mp3

## Usage

    $ yt_mp3 http://www.youtube.com/watch?v=DYyWVlh8NLM

## YouTube MP3 API:
This gem was build on top of [YouTube-Mp3.org](http://youtube-mp3.org). Every MP3 file convertion are made by them. There I've described an API:

### Request a video to mp3 convert:
GET: http://www.youtube-mp3.org/api/pushItem/?item=#{video_url}&xy=yx&bf=false&r=#{Time.now.to_i}
RESPONSE: video_id

  HTTParty.get("http://www.youtube-mp3.org/api/pushItem/?item=http%3A//www.youtube.com/watch%3Fv%3D41L3a0QUzwY%26feature%3Dg-all-u&xy=yx&bf=false&r=#{Time.now.to_i}").body
  => "41L3a0QUzwY"

### Get video info (we need it to get a hash). Repeat until status is "serving".
GET: http://www.youtube-mp3.org/api/itemInfo/?video_id=#{video_id}&ac=www&r=#{Time.now.to_i}
RESPONSE: info JSON fetched by response.body.match(/\Ainfo = (.*?);\z/)[1]

  HTTParty.get()

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

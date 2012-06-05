require 'timeout'
require 'httparty'
require 'uri'
require 'json'

module YTMp3
  class YouTubeMP3

    attr_reader :url, :downloadable, :title

    def initialize( url_or_id )
      @url = YTMp3::uri?(url_or_id) ? url_or_id : "http://youtube.com/watch?v=#{url_or_id}"
    end

    def convert
      r = HTTParty.get "http://www.youtube-mp3.org/api/pushItem/?item=#{URI.escape(@url)}&xy=yx&bf=false&r#{Time.now.to_i}"

      raise RequestFailed, "YouTubeMP3 service responsed: #{r.body}" unless r.response.class == Net::HTTPOK

      video_id = r.body

      Timeout::timeout(YOUTUBE_MP3_TIMEOUT) do
        while true
          r = HTTParty.get "http://www.youtube-mp3.org/api/itemInfo/?video_id=#{video_id}&ac=www&r=#{Time.now.to_i}"

          raise RequestFailed, "YouTubeMP3 service responsed: #{r.body}" unless r.response.class == Net::HTTPOK

          info = JSON.parse(r.body.match(/\Ainfo = (.*?);\z/)[1])

          if info["status"] == "serving"
            @downloadable = "http://www.youtube-mp3.org/get?video_id=#{video_id}&h=#{info['h']}&r=#{Time.now.to_i}"
            @title = info["title"]
            break
          end
        end
      end      
    end

    def download
      raise DownloadError, "File not converted yet" unless @downloadable
      system "curl --progress-bar -L \"#{@downloadable}\" > \"#{@title}\".mp3"
    end
  end
end
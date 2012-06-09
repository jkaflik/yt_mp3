require 'httparty'
require 'uri'
require 'oj'

module YTMp3
  class YouTubeMP3

    attr_reader :url, :downloadable, :title

    def initialize( url_or_id )
      @url = YTMp3::uri?(url_or_id) ? url_or_id : "http://youtube.com/watch?v=#{url_or_id}"
    end

    def convert
      r = HTTParty.get "http://www.youtube-mp3.org/api/pushItem/?item=#{CGI.escape(@url)}&xy=yx&bf=false&r=#{Time.now.to_i}", :headers => {"Accept-Location" => "*"}

      raise RequestFailed, "Something went wrong (not HTTP OK)" unless r.response.class == Net::HTTPOK
      handle_error(r.body)

      video_id = r.body

      while true
        r = HTTParty.get "http://www.youtube-mp3.org/api/itemInfo/?video_id=#{video_id}&ac=www&r=#{Time.now.to_i}", :headers => {"Accept-Location" => "*"}

        raise RequestFailed, "Something went wrong (not HTTP OK)" unless r.response.class == Net::HTTPOK

        info = Oj.load(r.body.match(/\Ainfo = (.*?);\z/)[1])

        if info["status"] == "serving"
          @downloadable = "http://www.youtube-mp3.org/get?video_id=#{video_id}&h=#{info['h']}&r=#{Time.now.to_i}"
          @title = info["title"]
          break
        end

        yield info if block_given?
      end
    end

    def download
      raise DownloadError, "File not converted yet" unless @downloadable
      system "curl --progress-bar -L \"#{@downloadable}\" > \"#{@title.gsub(/\//,"-")}.mp3\""
    end

    protected

    def handle_error( body )
      case body
        when "$$$LIMIT$$$" then raise RequestFailed, "YouTubeMP3 limit reached! Only 15 convertions per 30 minutes."
        when "$$$ERROR$$$" then raise RequestFailed, "There was an Error caused by YouTube, we cannot deliver this Video! This error is mostly caused by copyright issues or the length of the video. YouTubeMP3 only support videos with maximum of 20 minutes."
      end
    end
  end
end
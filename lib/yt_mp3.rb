require "yt_mp3/version"
require "yt_mp3/youtube_mp3"

module YTMp3
  def self.uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

  class RequestFailed < StandardError; end

  YOUTUBE_MP3_TIMEOUT = 90
end

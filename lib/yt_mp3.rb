require "yt_mp3/version"
require "yt_mp3/youtube_mp3"
require "yt_mp3/sync"

module YTMp3
  def self.uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

  def self.download_progress(mp3)
    puts "Processing #{mp3.url}..."
    begin
      mp3.convert
    rescue Exception => e
      STDERR.puts e
    end

    begin
      mp3.download
    rescue DownloadError
      STDERR.puts "Failed to download. Video cannot be converted. Could not exists."
    end
  end

  class RequestFailed < StandardError; end
  class DownloadError < StandardError; end
  class SyncError < StandardError; end

  YOUTUBE_MP3_TIMEOUT = 90
end

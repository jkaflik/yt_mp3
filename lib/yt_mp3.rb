require "yt_mp3/version"
require "yt_mp3/youtube_mp3"
require "yt_mp3/sync"

require "yt_mp3/badge_progress_bar"

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
    puts ":: #{mp3.url}\n"
    
    bar = BadgeProgressBar.new
    bar.badge = "Converting"

    begin
      mp3.convert do |info|
        bar.count = (info["progress"].to_f * 100).abs
        bar.write
      end

      begin
        mp3.download
      rescue DownloadError => e
        STDERR.puts "Failed to download. Video cannot be converted. Could not exists. (#{e})"
      end
    rescue RequestFailed => e
      STDERR.puts e
    end
  end

  class RequestFailed < StandardError; end
  class DownloadError < StandardError; end
  class SyncError < StandardError; end
end


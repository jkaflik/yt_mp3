require 'youtube_it'

module YTMp3
  class Sync
    attr_reader :videos_playlist
    attr_accessor :synced

    def initialize(options)
      client = YouTubeIt::Client.new
      videos = {}

      if options[:favorites]
        videos = client.videos_by(:favorites, :user => options[:favorites]).videos
      elsif options[:playlist]
        videos = client.playlist(options[:playlist].gsub(/\APL/, "")).videos
      else
        raise SyncError, "Sync by what?"
      end

      @videos_playlist = videos.collect { |v| v.unique_id }
      @synced = Array.new

      raise SyncError, "Empty playlist to synchronize" if @videos_playlist.empty?
    end

    def new_videos
      (@videos_playlist - @synced)
    end

    def sync
      new_videos.each do |video|
        @synced << video
        yield YTMp3::YouTubeMP3.new(video)
      end
    end
  end
end
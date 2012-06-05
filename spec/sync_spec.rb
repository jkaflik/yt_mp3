require 'spec_helper'

describe YTMp3::Sync do
  before do
    temp
  end

  it "loads playlist" do
    sync = YTMp3::Sync.new :playlist => "39D3FA44E3F75572"
    sync.new_videos.count.should be > 0
  end

  it "loads playlist with prefix" do
    sync = YTMp3::Sync.new :playlist => "PL39D3FA44E3F75572"
    sync.new_videos.count.should be > 0
  end
  
  it "loads user favorites" do
    sync = YTMp3::Sync.new :favorites => "SuchyKanal"
    sync.new_videos.count.should be > 0
  end

  it "does sync" do 
    sync = YTMp3::Sync.new :playlist => "PL912D4D7B38309EAA"
    sync.synced.count.should eq 0

    new_videos = sync.new_videos

    sync.sync do |mp3|
      mp3.should be_an_instance_of YTMp3::YouTubeMP3
    end

    sync.synced.should eq new_videos
  end
end
require 'spec_helper'

describe YTMp3::YouTubeMP3 do
  it "initialize by URL" do
    YTMp3::YouTubeMP3.new("http://www.youtube.com/watch?v=KlJy_Cb21Lw").url.should eq "http://www.youtube.com/watch?v=KlJy_Cb21Lw"
  end

  it "initialize by video_id" do
    YTMp3::YouTubeMP3.new("KlJy_Cb21Lw").url.should eq "http://youtube.com/watch?v=KlJy_Cb21Lw"
  end

  it "convert's video" do
    mp3 = YTMp3::YouTubeMP3.new("KlJy_Cb21Lw")
    mp3.convert
    mp3.downloadable.should include "http://www.youtube-mp3.org/get?video_id=KlJy_Cb21Lw"
  end

  it "has title" do
    mp3 = YTMp3::YouTubeMP3.new("KlJy_Cb21Lw")
    mp3.convert
    mp3.title.should eq "Lady Antebellum - Need You Now (HQ) [Lyrics]"
  end
end
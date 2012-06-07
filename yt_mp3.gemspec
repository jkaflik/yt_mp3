# -*- encoding: utf-8 -*-
require File.expand_path('../lib/yt_mp3/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = YTMp3::AUTHORS
  gem.email         = ["kofels@gmail.com"]
  gem.description   = %q{Quickly download video from YouTube to mp3. Sync the folder with playlists or favorites!}
  gem.summary       = %q{Downloading YouTube videos as mp3}
  gem.homepage      = "http://kofel.github.com/yt_mp3/"

  gem.rubyforge_project = "yt_mp3"
  gem.add_dependency "httparty"
  gem.add_dependency "youtube_it"
  gem.add_dependency "progress_bar"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "yt_mp3"
  gem.require_paths = ["lib"]
  gem.version       = YTMp3::VERSION
end

require 'rubygems'
require 'bundler/setup'

require 'yt_mp3' # and any other gems you need

module Helpers
  def temp
    system("mkdir -p tmp")
    Dir.chdir "tmp/"
  end
end

RSpec.configure do |config|
  config.include Helpers
end
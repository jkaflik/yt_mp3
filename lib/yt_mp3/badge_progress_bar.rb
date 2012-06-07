require "progress_bar"

module YTMp3
  class BadgeProgressBar < ProgressBar 
    attr_accessor :badge

    def initialize(*args)
      super 100, :badge, :bar, :percentage, :elapsed
    end

    protected

    def render_badge
      @badge
    end

    def badge_width
      @badge.length
    end
  end
end
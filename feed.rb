# frozen_string_literal: true

require 'open-uri'
require 'feedjira'

class Feed
  BLOG_FEED = 'https://karreiro.com/feed.xml'

  def entries
    feed.entries.first(3)
  end

  private

  def feed
    Feedjira.parse(read_blog_feed)
  end

  def read_blog_feed
    URI.open(BLOG_FEED).read
  end
end

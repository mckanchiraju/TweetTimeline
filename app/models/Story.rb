require "pry"

class Story
  attr_accessor :data, :type, :date, :title

  def initialize(data = {})
    @data = data
    @type = self.class.to_s.downcase
  end

  def api_hash
    {
        type: @type,
        date: @date,
        title: @title
    }
  end

  def self.get_feed(data = {})
    nytimes = Headline.get_ny_times_headlines({q: data[:nytimes_q], start_date: data[:start_date], end_date: data[:end_date]})
    tweets = Tweet.get_tweet({tweet_q: data[:tweet_q], tweet_handle: data[:tweet_handle]})
    feed = nytimes + tweets
    feed.sort_by{|f| f[:date]}
  end

end
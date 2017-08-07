require "pry"
require "date"

class Tweet < Story

  def initialize(data = {})
    super
     @title = data.text

     @date = Date.parse(data.created_at.to_s).strftime("%m-%d-%Y")

  end

  def self.get_tweet(data)
    # http://localhost:3000/api/headlines/index.json?nytimes_q=trump&start_date=20170301&end_date=20170501&tweet_handle=realDonaldTrump&tweet_q=China


    @request = TwitterApi::Request.new do |config|
      config.consumer_key = "2fdleAE5QvieWJo4LOQ7hIoiP"
      config.consumer_secret = "HI2WNYRN0qGexIGB4jby1r7MmSA49dTYUYtv2hd25y4vHcHUqa"
      config.access_token = "3660171796-tlMApqfuMzvQ9eYWproWoSEJY4ftlgiOp0nFMtl"
      config.access_token_secret = "eXYGo8wfP6S559XFO15BgUmfglyjck4wf44iCqaOXOOkr"
    end

    search_string = "from:#{data[:tweet_handle]} #{data[:tweet_q]}"

    @request.get_tweets(search_string).map do |f|
      @tweet = Tweet.new(f)
      @tweet.api_hash
    end

    #req = TwitterApi::Request.new do |config|

    #config.consumer_key = "2fdleAE5QvieWJo4LOQ7hIoiP"
    #config.consumer_secret = "HI2WNYRN0qGexIGB4jby1r7MmSA49dTYUYtv2hd25y4vHcHUqa"
    #config.access_token = "3660171796-tlMApqfuMzvQ9eYWproWoSEJY4ftlgiOp0nFMtl"
    #config.access_token_secret = "eXYGo8wfP6S559XFO15BgUmfglyjck4wf44iCqaOXOOkr"

    #config.params = "from:realDonaldTrump china"
    #end

    #req.get_tweets.each do |f|
    #puts f.text
    #puts f.created_at
    #end

  end

end
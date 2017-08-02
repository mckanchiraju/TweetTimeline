require "twitter_api/version"
require "twitter"

module TwitterApi

  class Config < Struct.new(:consumer_key, :consumer_secret, :access_token, :access_token_secret, :params)
  end

  class Request

    def initialize
      yield config if block_given?

      @client = Twitter::REST::Client.new do |conf|
        conf.consumer_key        = config.consumer_key
        conf.consumer_secret     = config.consumer_secret
        conf.access_token        = config.access_token
        conf.access_token_secret = config.access_token_secret
      end
    end

    def config
      @config ||= Config.new
    end

    def get_tweets
        @client.search(config.params)
    end
  end
end


#req = TwitterApi::Request.new do |config|
#
  #config.consumer_key = "2fdleAE5QvieWJo4LOQ7hIoiP"
  #config.consumer_secret = "HI2WNYRN0qGexIGB4jby1r7MmSA49dTYUYtv2hd25y4vHcHUqa"
  #config.access_token = "3660171796-tlMApqfuMzvQ9eYWproWoSEJY4ftlgiOp0nFMtl"
  #config.access_token_secret = "eXYGo8wfP6S559XFO15BgUmfglyjck4wf44iCqaOXOOkr"

  #config.params = "from:realDonaldTrump china"
#end

#req.get_tweets.each do |f|
 # puts f.text
#end
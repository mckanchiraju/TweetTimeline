require "market_api/version"
require "market_beat"

module MarketApi


  class Config < Struct.new(:params)
  end

  class Request

    def initialize
      yield config if block_given?
    end

    def config
      @config ||= Config.new
    end

    def call
      name = config.params[:name]
      start_date = config.params[:start_date]
      end_date = config.params[:end_date]

      MarketBeat.quotes(name, start_date, end_date)
    end

  end
end


#req = MarketApi::Request.new do |config|
#  config.params = {name: "AAPL", start_date: "2011-12-21", end_date: "2011-12-25"}
#end
#
#res = req.call
#binding.pry
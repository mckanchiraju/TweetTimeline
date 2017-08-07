require "pry"
require "date"

class Headline < Story

  def initialize(data = {})
    super
    @title = data['headline']['main']
    @date = Date.parse(data['pub_date']).strftime("%m-%d-%Y")
  end

  def self.get_ny_times_headlines(data)
    req = NyTimes::Request.new do |config|
      config.api_key = "8aaf2a4f97a74f7980ecbc88f3d06795"
      config.params = {
          q: data[:q],
          start_date: data[:start_date],
          end_date: data[:end_date],
          fl: "headline,pub_date"}
    end
    res = JSON.parse(req.call)["response"]["docs"]
    res.map do |h|
      headline = Headline.new(h)
      headline.api_hash
    end
  end

end
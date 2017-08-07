require "ny_times"
require "pry"
require "JSON"
require "Headline"

class Api::HeadlinesController < ApplicationController
  def index
    render json: Story.get_feed(params)
  end
end

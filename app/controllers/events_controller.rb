class EventsController < ApplicationController
  def index
    count = 20
    types = ["tweet", "headline"]
    date = DateTime.now + count
    fake_data = (1..count).map do |n| 
      {
        id: n, 
        content: Forgery(:lorem_ipsum).words(rand(20..25)), 
        title: Forgery(:lorem_ipsum).words(rand(3..5)), 
        date: (date - n).strftime("%b %-d"),
        type: types[rand.round]
      }
    end.to_a
    render json: { data: fake_data }
  end
end

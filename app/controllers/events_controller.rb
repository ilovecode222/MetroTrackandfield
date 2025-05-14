class EventsController < ApplicationController
  def leaderboard
    @events = Event.includes(results: :athlete).all
  end
end

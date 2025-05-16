class SeedsController < ApplicationController
  def add_events
    events = [
      "100m Dash",
      "200m Dash",
      "400m Dash",
      "One Mile Run",
      "4x100m Relay"
    ]

    events.each do |event_name|
      Event.find_or_create_by(name: event_name)
    end

    render plain: "Events added!"
  end
end

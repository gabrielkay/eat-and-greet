class MyEventsController < ApplicationController
  def index
    @created_events = current_user.events.future.order(:start_time)
    @joined_events = (current_user.events_as_member.future.order(:start_time) - @created_events)
  end
end

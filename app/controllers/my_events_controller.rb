class MyEventsController < ApplicationController
  def index
    @joined_events = current_user.events_as_member - current_user.events
    @created_events = current_user.events
  end
end

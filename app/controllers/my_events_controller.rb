class MyEventsController < ApplicationController
  def index
    @joined_events = (current_user.events_as_member.future - current_user.events.future)
    @created_events = current_user.events.future
  end
end

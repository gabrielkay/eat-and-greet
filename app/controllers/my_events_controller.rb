class MyEventsController < ApplicationController
  def index
    @events = current_user.events_as_member
  end
end

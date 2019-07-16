class MyEventsController < ApplicationController
  def index
    @events = current_user.events_as_member
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
    # Will need to be restricted to the event creator
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path
  end
end

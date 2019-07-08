class EventsController < ApplicationController
  def index
    @events = Event.where(city: current_user.location)
    # (user/events index will be index of the user's events that they've joined)
  end

  def show
    @event = Event.find(params[:id])
    @existing_membership = Membership.find_membership(current_user, @event)
    @membership = Membership.new
    @comments = Comment.where(event_id: @event.id, comment_id: nil)
    @comment = Comment.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.city = current_user.location
    @event.creator_id = current_user.id
    if (@event.save)
      redirect_to events_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    # Will need to be restricted to the event creator
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private def event_params
    params.require(:event).permit(:restaurant, :min_people, :max_people, :start_time, :description)
  end
end

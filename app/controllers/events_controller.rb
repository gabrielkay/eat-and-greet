class EventsController < ApplicationController

  before_action :auth_user

  def index
    @events = Event.search_location(params[:search_location] || current_user.location, current_user.id)
    @locations = Event.distinct.pluck(:city)
    # once we have our list of cities, this will be set to that. We can make a constant array in events class
    # add a page for no events in the area
  end

  def show
    @event = Event.find(params[:id])
    @existing_membership = Membership.find_membership(current_user, @event)
    @membership = Membership.new
    @comments = @event.comments
    @comment = Comment.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.build_with_member(current_user, event_params)
    if (@event.save)
      redirect_to my_tables_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    if @event.update(event_params)
      redirect_to my_tables_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path
  end

  private def event_params
    params
      .require(:event)
      .permit(
        :title,
        :event_pic,
        :restaurant,
        :restaurant_address,
        :city,
        :min_people,
        :max_people,
        :start_time,
        :end_time,
        :description,
        :diet,
        :topic)
  end
end

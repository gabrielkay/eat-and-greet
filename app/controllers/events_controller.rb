class EventsController < ApplicationController

  before_action :auth_user

  def index
    @events = Event.future.search_location(params[:search_location] || current_user.location, current_user.id)
  end

  def show
    @event = Event.find(params[:id])
    @existing_membership = Membership.find_membership(current_user, @event)
    @membership = Membership.new
    @comments = @event.comments
    @comment = Comment.new
    @time_zone = current_user.get_time_zone
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.build_with_member(current_user, event_params)
    @event = convert_to_datetime_and_assign(@event, event_params)
    if (@event.save)
      redirect_to user_path(current_user.slug)
    else
      flash_errors(@event.errors)
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event = convert_to_datetime_and_assign(@event, event_params)
    authorize @event
    if @event.update(event_params)
      redirect_to user_path(current_user.slug)
    else
      flash_errors(@event.errors)
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path
  end

  def convert_to_datetime_and_assign(event, params)
    if params[:date_field].include?('/')
      date_field = Date.strptime(params[:date_field], "%m/%d/%Y").strftime("%Y-%m-%d")
    else
      date_field = Date.parse(params[:date_field]).strftime("%Y-%m-%d")
    end
    start_time_field = Time.parse(params[:start_time_field]).strftime("%H:%M:%S")
    end_time_field = Time.parse(params[:end_time_field]).strftime("%H:%M:%S")
    event.start_time = DateTime.parse("#{date_field} #{start_time_field}")
    event.end_time = DateTime.parse("#{date_field} #{end_time_field}")
    event
  rescue ArgumentError
    event.errors.add(:start_time, "Date or time was invalid")
    event
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
        :date_field,
        :start_time_field,
        :end_time_field,
        :description,
        :diet,
        :topic)
  end
end

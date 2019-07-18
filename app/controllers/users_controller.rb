class UsersController < ApplicationController
  def show
    @user = User.find_by slug: params[:slug]
    @created_events = @user.events
    @archived_events = @user.events_as_member.where("start_time < ?", DateTime.now.end_of_day)
  end
end

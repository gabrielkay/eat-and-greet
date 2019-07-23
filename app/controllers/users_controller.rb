class UsersController < ApplicationController
  def show
    @user = User.find_by slug: params[:slug]
    @created_events = @user.events.future
    @archived_events = @user.events_as_member.past
  end
end

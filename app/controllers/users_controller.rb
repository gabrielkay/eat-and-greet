class UsersController < ApplicationController
  def show
    @user = User.find_by slug: params[:slug]
    @created_events = @user.events.future.order(:start_time)
    @archived_events = @user.events_as_member.past.order(:start_time).reverse_order
  end
end

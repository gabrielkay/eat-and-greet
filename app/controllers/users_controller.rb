class UsersController < ApplicationController
  def show
    @user = User.find_by slug: params[:slug]
    @created_events = @user.events
  end
end

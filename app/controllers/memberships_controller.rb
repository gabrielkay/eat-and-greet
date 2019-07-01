class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      redirect_back(fallback_location: root_path)
    else
      @membership.errors.full_messages.each do |msg|
        flash[:error] = "Error: #{msg}"
      end
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to root_path
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :event_id)
  end
end

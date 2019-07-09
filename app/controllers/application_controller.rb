class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  def flash_errors(errors)
    errors.full_messages.each do |msg|
      flash[:alert] = "Error: #{msg}"
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action"
    redirect_to(request.referrer || root_path)
  end
end

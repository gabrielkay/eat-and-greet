class ApplicationController < ActionController::Base
  def flash_errors(errors)
    errors.full_messages.each do |msg|
      flash[:alert] = "Error: #{msg}"
    end
  end
end

class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    unless @comment.save
      flash_errors(@comment.errors)
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :event_id, :comment_id)
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    comment = Comment.new(comment_params)
    #comment.user_id = current_user.id
    comment.save
    redirect_to post_path(comment_params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commentary, :post_id, :user_id)
  end
end

class CommentsController < ApplicationController
  def new
  end

  def create
    Comment.create(comment_params)
    redirect_to post_path(comment_params[:post_id])
  end

  private

  def comment_params
  params.require(:comment).permit(:commentary, :post_id)
 end
end

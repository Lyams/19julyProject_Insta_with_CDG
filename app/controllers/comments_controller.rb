class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    # comment.user = current_user
    authorize comment
    comment.save
    redirect_to user_post_path(id: comment.post.id,
                               user_id: comment.post.user.id), notice: 'The comment was created successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:commentary, :post_id, :user_id)
  end
end

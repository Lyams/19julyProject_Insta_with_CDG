class LikesController < ApplicationController
  def create
    post = Post.find(params[:post])
    Like.create(current_user, post)
    redirect_back(fallback_location: user_posts_path(likes_params[:user_id, :id]))
  end

  def destroy
    post = Post.find(params[:post])
    Like.destroy(current_user, post)
    redirect_back(fallback_location: user_posts_path(likes_params[:user_id, :id]))
  end

  private

  def likes_param
    params.require(:post).permit(:id, :user_id)
  end
end

class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    Like.create(user_id: current_user.id, post_id: post.id)
    redirect_back(fallback_location: user_posts_path(post))
  end

  def destroy
    post = Post.find(params[:id])
    Like.where(post_id: post.id, user_id: current_user.id).destroy_all
    redirect_back(fallback_location: user_posts_path(post))
  end

end

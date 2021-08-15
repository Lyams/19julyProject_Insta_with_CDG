class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  def create
    if Like.where(user_id: current_user.id, post_id: @post.id).blank?
      Like.create(user_id: current_user.id, post_id: @post.id)
    end
    redirect_back(fallback_location: user_posts_path(@post))
  end

  def destroy
    Like.where(post_id: @post.id, user_id: current_user.id).destroy_all
    redirect_back(fallback_location: user_posts_path(@post))
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end

class FeedPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.followings.exists?
      @posts = Post.where(user_id: current_user.followings.ids).order(created_at: :desc)
    else
      @posts = Post.none
    end
    @kind = 'Follow'
    render 'posts/index'
  end
end

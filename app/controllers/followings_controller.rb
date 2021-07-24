class FollowersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @followings = @user.followings
  end

  def create
    follower_user = current_user
    following_user = User.find(params[:following_id])
    Follow.create(follower: follower_user, following: following_user)
    redirect_to user_followers_path(current_user)
  end
end

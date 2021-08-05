class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users

    def create
      Follow.create(follower: @follower_user, following: @following_user)
      redirect_back(fallback_location: user_followings_path(@follower_user))
    end

  def destroy
    if follow = Follow.find_by(follower: @follower_user, following: @following_user)
      follow.destroy
    end
    redirect_back(fallback_location: user_followers_path(@follower_user))
  end

  private

  def set_users
    @follower_user = current_user
    @following_user = User.find(params[:following_id])
  end
end
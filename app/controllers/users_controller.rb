class UsersController < ApplicationController
  before_action :set_user, except: %i[ index ]
  before_action :authenticate_user!, except: %i[show index]

  def show
    @followers = @user.followers
    @followings = @user.followings
  end

  def edit
  end

  def index
    @users = User.all
  end

  def update
    @user = current_user
    if @user.update(user_update_params)
      redirect_to user_path(@user), notice: "Users info was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_update_params
    params.require(:user).permit(:name, :bio)
  end
end
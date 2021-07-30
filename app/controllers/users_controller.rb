class UsersController < ApplicationController
  before_action :set_user, except: %i[ index ]

  def show
  end

  def edit
  end

  def index
    @users = User.all
  end

  def update
    if @user.update(user_update_params)
      redirect_to user_path(@user)
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
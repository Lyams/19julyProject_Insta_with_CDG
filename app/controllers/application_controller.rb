class ApplicationController < ActionController::Base
  include Pundit

  protected

  def pundishing_user
    flash[:error] = 'You has been pundished'
    redirect_to root_path
  end

  private

  rescue_from Pundit::NotAuthorizedError, with: :pundishing_user

  def after_sign_in_path_for(user)
    user_posts_path(user)
  end
end

class ApplicationController < ActionController::Base
  include Pundit
  private
  rescue_from Pundit::NotAuthorizedError, with: :pundishing_user
=begin
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_post_path
    end
  end
=end

  def after_sign_in_path_for(user)
    user_posts_path(user)
  end
  protected

  def pundishing_user
    flash[:error] = 'You has been pundished'
    redirect_to root_path
  end
end

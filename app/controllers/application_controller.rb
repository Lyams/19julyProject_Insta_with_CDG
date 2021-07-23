class ApplicationController < ActionController::Base

  private

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
end

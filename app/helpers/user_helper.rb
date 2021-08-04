module UserHelper
  def has_following?(current_user, following_user)
    Follow.find_by(follower: current_user, following:  following_user).present?
  end
end
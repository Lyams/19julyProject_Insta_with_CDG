module LikeHelper
  def has_like?(post, current_user)
    Like.find_by(post_id: post.id, user_id: current_user.id)
  end

  def count_likes(post)
    post.likes.count
  end
end


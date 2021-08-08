class UserPolicy
  attr_reader :user, :post

  def initialize(user, user_with_right)
    @current_user = user
    @user_with_right = user_with_right
  end

  def edit?
    @current_user == @user_with_right
  end

  def update?
    @current_user == @user_with_right
  end
end
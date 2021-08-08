class CommentPolicy
  attr_reader :user, :author

  def initialize(user, comment)
    @user = user
    @author = comment.user
  end

  def edit?
    @user == @author
  end

  def create?
    @user == @author
  end

  def new?
    @user == @author
  end

end
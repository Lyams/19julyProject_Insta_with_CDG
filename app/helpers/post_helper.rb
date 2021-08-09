module PostHelper
  def kind_of_index(user=nil)
    if user.nil?
      'Posts of feed'
    else
      "Posts of #{user.name}"
    end
  end
end

module PostHelper
  def kind_of_index(user=nil)
    if user.nil?
      'Follows posts'
    else
      "Posts of #{user.name}"
    end
  end
end
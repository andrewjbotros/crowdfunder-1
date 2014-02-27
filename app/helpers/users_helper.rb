module UsersHelper

  def name_display(user)
    self?(user) ? 'you' : user.username
  end

end
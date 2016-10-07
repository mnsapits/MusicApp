module ApplicationHelper
  def make_username
    current_user.email.split("@")[0].capitalize
  end
end

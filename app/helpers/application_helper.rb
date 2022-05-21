module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar, class: "dropdown-toggle user-icon", id: "dropdownMenuButton1"
    else
      image_tag "default_icon.jpg", class: "dropdown-toggle user-icon", id: "dropdownMenuButton1"
    end
  end
end

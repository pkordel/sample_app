module UserSessionsHelper
  def signin_user(user)
    session[:user_id] = user.id
  end

  def signout_user
    reset_session
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user
  end
end

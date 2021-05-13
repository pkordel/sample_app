module UserSessionsHelper
  def signin_user(user)
    session[:user_id] = user.id
    # Guard against session replay attacks.
    # See https://bit.ly/33UvK0w for more.
    session[:session_token] = user.session_token
  end

  def remember_user(user)
    user.remember!
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget_user(user)
    user.forget!
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def signout_user
    return unless user_signed_in?

    forget_user(current_user)
    reset_session
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user && session[:session_token] == user.session_token
        @current_user ||= user
      end
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        signin_user(user)
        @current_user = user
      end
    end
  end

  def user_signed_in?
    current_user
  end
end

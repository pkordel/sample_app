class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user&.authenticate(session_params[:password])
      reset_session
      signin_user(user)
      redirect_to current_user
    else
      flash.now[:danger] = "Invalid signin"
      render 'new'
    end
  end

  def destroy
    signout_user
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end

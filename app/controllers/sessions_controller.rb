class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(session_params[:email],
      session_params[:password])
    if @user
      login(@user)
      redirect_to bands_url
    else
      flash[:errors] = ["Username or password incorrect."]
      redirect_to new_session_url
    end
  end

  def new
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end


  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end

class AuthenticationController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to talks_path
    else
      render :new
      @sign_in_error = "WRONG LOL"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

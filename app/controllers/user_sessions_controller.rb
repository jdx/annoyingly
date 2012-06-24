class UserSessionsController < ApplicationController

  skip_before_filter :authenticate

  def new
  end

  def create
    user = User.find_by_email(params[:user_session][:email])
    if user and user.authenticate(params[:user_session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end
end

class UserSessionsController < ApplicationController
  def new
    return render :text => params[:query] if params[:query].present?
    @user = UserSession.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
    else
      render :new
    end
  end
end

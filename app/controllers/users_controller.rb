class UsersController < ApplicationController

  skip_before_filter :authenticate

  def new
    @user = User.new
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

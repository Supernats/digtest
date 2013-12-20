class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:session][:username],
      params[:session][:password]
    )
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["invalid login"]
      render :new
    end
  end


  def destroy
    logout_user!
    redirect_to new_session_url
  end


  def new
    @user = User.new
    render :new
  end


end

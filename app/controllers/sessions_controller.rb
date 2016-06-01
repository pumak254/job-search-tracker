class SessionsController < ApplicationController
  
  def new
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user_id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  
end

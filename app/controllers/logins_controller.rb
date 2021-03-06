class LoginsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in"
      redirect_to books_path
    else
      flash.now[:danger] = "Your email address or password does not match"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to home_path
  end
end
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email_address])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.email_address}!"
      redirect_to links_path
    else
      flash[:danger] = "Invalid username or password"
      redirect_to :back
    end
  end

  def destroy
    session.clear
    flash[:success] = "You have succesfully logged out."
    redirect_to root_path
  end
end

class UsersController < ApplicationController
  def new
    @user = User.create
  end

  def create
    user = User.create(user_params)
    user.save
    session[:user_id] = user.id
    redirect_to links_path
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end

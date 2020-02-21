class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @suer = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to edit_user_path(user)
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:email)
  end

end

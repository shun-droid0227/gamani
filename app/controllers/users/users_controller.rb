class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def home
    @user = current_user
    @post = Post.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:email)
  end

end

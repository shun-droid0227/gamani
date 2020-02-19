class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(@user)
  end

end

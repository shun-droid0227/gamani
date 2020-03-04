class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def home
    @user = current_user
    @post = Post.new

    get_users = current_user.followings.pluck(:id)
    get_users.push(current_user.id)
    @time_line_posts = Post.where(user_id: get_users)
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
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:email,:image,:roll_image)
  end

end

class Users::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only:[:edit,:update]

  def home
    @user = current_user
    @post = Post.new

    get_users = current_user.followings.pluck(:id)
    get_users.push(current_user.id)
    @time_line_posts = Post.where(user_id: get_users).order(created_at: :desc)
  end

  def index
    search_word = params[:search_word]
    @search_content = params[:search_content]
    if @search_content == "post"
      @contents = Post.search(search_word)
    elsif @search_content == "user"
      @contents = User.search(search_word)
    elsif @search_content == "thread"
      @contents = ChatThread.search(search_word)
      @thread = ChatThread.new
    end
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
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

  def correct_user
    if params[:id].to_i != current_user.id
      redirect_to user_path(current_user)
    end
  end

end

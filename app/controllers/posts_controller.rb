class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @post = Post.new
    @post.post_images.build
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save(post_params)
    @post = Post.new
    @user = current_user
    get_users = current_user.followings.pluck(:id)
    get_users.push(current_user.id)
    @time_line_posts = Post.where(user_id: get_users).order(created_at: :desc)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    @post = Post.new
    redirect_to users_home_path
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :sentence, :post_id, post_images_images:[])
  end

end

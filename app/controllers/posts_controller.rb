class PostsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save(post_params)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:user_id,:image,:sentence)
  end

end
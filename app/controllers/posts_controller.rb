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
    redirect_to user_path(current_user)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to current_user
  end


  private

  def post_params
    params.require(:post).permit(:user_id,:image,:sentence)
  end

end

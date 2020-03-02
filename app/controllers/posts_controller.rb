class PostsController < ApplicationController

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
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    @post = Post.new
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :sentence, :post_id, post_images_images:[])
  end

end

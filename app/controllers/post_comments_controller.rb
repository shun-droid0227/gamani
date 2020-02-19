class PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:id])
    post_comment = PostComment.new(post_comment_params)
    post_comment.user_id = current_user.id
    post_comment.post_id = post.id
    if post_comment.save(post_comment_params)
      redirect_to post
    else
      redirect_to current_user
    end

  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to posts_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:user_id,:post_id,:image,:sentence)
  end

end

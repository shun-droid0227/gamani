class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:id])
    post_comment = PostComment.new(post_comment_params)
    post_comment.user_id = current_user.id
    post_comment.post_id = @post.id
    post_comment.save(post_comment_params)
    @post_comment = PostComment.new
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    @post = Post.find(post_comment.post_id)
    @post_comment = PostComment.new
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:sentence)
  end

end

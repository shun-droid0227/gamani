class FavoriteThreadsController < ApplicationController
  
  def create
    @chat_thread = ChatThread.find(params[:chat_thread_id])
    favorite = current_user.favorite_threads.new(chat_thread_id: @chat_thread.id)
    favorite.save
  end

  def destroy
    @chat_thread = ChatThread.find(params[:chat_thread_id])
    favorite = current_user.favorite_threads.find_by(chat_thread_id: @chat_thread.id)
    favorite.destroy
  end

end

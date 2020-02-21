class ChatThreadsController < ApplicationController
  
  def index
    @new_thread = ChatThread.new
    @chat_threads = ChatThread.all
  end

  def create
    chat_thread = ChatThread.new(chat_thread_params)
    chat_thread.save
    redirect_to chat_threads_path
  end

  def show
    @chat_thread = ChatThread.find(params[:id])
    @response = Response.new
  end

  private

  def chat_thread_params
    params.require(:chat_thread).permit(:name,:game_tittle_id)
  end

end

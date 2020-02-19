class ChatThreadsController < ApplicationController
  
  def index
    @new_thread = ChatThread.new
    @chat_threads = ChatThread.all
  end

  def create
    chat_thread = ChatThread.new

  end

  private

  def chat_thread_params
    params.require(:chat_thread).permit(:name,:game_thread_id)
  end

end

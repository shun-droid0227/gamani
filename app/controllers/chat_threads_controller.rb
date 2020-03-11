class ChatThreadsController < ApplicationController

  before_action :authenticate_user!

  def new
    @new_thread = ChatThread.new
  end
  
  def index
    @new_thread = ChatThread.new
    @chat_threads = ChatThread.all
  end

  def create
    chat_thread = ChatThread.new(chat_thread_params)
    chat_thread.game_tittle_id = 1
    chat_thread.save
    response = Response.create(chat_thread_id: chat_thread.id,user_id: current_user.id,sentence: params[:sentence])
    redirect_to chat_thread_path(chat_thread)
  end

  def show
    @chat_thread = ChatThread.find(params[:id])
    @thread_responces = @chat_thread.responses.order(created_at: :desc)
    @response = Response.new
  end


  private

  def chat_thread_params
    params.require(:chat_thread).permit(:name,:game_title_id)
  end

end

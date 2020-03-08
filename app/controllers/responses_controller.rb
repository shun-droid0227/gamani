class ResponsesController < ApplicationController

  before_action :authenticate_user!

  def create
    response = Response.new(response_params)
    response.user_id = current_user.id
    response.save
    redirect_to chat_thread_path(response.chat_thread_id)
  end

  def response_params
    params.require(:response).permit(:sentence,:user_id,:chat_thread_id,:image)
  end

end

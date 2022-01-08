class MessagesController < ApplicationController
  def create
    @message = Message.create(params.permit(:message, :conversation_id, :user_id))
    render json: { message: @message }
  end
end
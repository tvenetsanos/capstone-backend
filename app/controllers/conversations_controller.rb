class ConversationsController < ApplicationController
  def get_conversations
    @conversations = Conversation.where(first_user_id: session[:user_id]) + Conversation.where(second_user_id: session[:user_id])
    render json: { conversations: @conversations }
  end

  def get_conversation
    puts params[:id]
    @conversation = Conversation.find_by(id: params[:id])
    @messages = Message.where(conversation_id: @conversation.id)
    render json: { messages: @messages.sort{|a,b| a.created_at <=> b.created_at } }
  end
  
  def create
    @conversation = Conversation.create(params.permit(:first_user_id, :second_user_id))
    render json: { conversation: @conversation }
  end

  def delete
    Conversation.find_by(id: User.find_by(id: session[:user_id]).conversation_id).destroy
    head 200
  end
end
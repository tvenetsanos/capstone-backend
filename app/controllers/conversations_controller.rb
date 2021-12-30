class ConversationsController < ApplicationController
  def get_conversations
    @conversations = Conversation.where(user_id: session[:user_id])
    render json: @conversations
  end

  def get_conversation
    @conversation = Conversation.find_by(id: params[:conversation_id])
    @messages = Message.where(conversation_id: @conversation.id)
    render json: { messages: @messages.sort{|a,b| a.created_at <=> b.created_at } }
  end
  
  def create
    @conversation = Conversation.create(params)
    render json @conversation
  end

  def delete
    Conversation.find_by(id: User.find_by(id: session[:user_id]).conversation_id).destroy
    head 200
  end
end
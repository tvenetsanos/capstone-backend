class ConversationsController < ApplicationController
  def get_conversations
    @conversations = Conversation.where(first_user_id: session[:user_id]) + Conversation.where(second_user_id: session[:user_id])
    render json: { conversations: @conversations }
  end

  def get_conversation
    @conversation = Conversation.find_by(id: params[:id])
    @messages = Message.where(conversation_id: @conversation.id)
    render json: { messages: @messages.sort{|a,b| a.created_at <=> b.created_at } }
  end
  
  def get_or_create
    if isLoggedIn?
      @conversation = Conversation.find_by(first_user_id: params[:first_user_id], second_user_id: params[:second_user_id]) || Conversation.find_by(first_user_id: params[:second_user_id], second_user_id: params[:first_user_id])
      if !@conversation
        @conversation = Conversation.create(params.except(:conversation).permit(:first_user_id, :second_user_id))
      end
      render json: { conversation: @conversation }
    else
      head 403
    end
  end

  def delete
    Conversation.find_by(id: User.find_by(id: session[:user_id]).conversation_id).destroy
    head 200
  end
end
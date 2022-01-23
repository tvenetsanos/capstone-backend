class ConversationsController < ApplicationController
  def index
    @first_convos = Conversation.where(first_user_id: session[:user_id]).map{|convo| { conversation: convo, topMessage: convo.messages.sort{|a,b| b.created_at <=> a.created_at }.first(), userTo: convo.second_user }}
    @second_convos = Conversation.where(second_user_id: session[:user_id]).map{|convo| { conversation: convo, topMessage: convo.messages.sort{|a,b| b.created_at <=> a.created_at }.first(), userTo: convo.first_user }}
    render json: { conversations: @first_convos + @second_convos }
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    render json: { messages: @conversation.messages.sort{|a,b| a.created_at <=> b.created_at } }
  end
  
  def create
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

  def destroy
    Conversation.find_by(id: params[:id]).destroy
    head 200
  end
end
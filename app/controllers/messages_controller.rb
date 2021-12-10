require 'pry'
class MessagesController < ApplicationController
  def get_messages
    @messages = Message.where(dog_id: session[:dog_id], dog_to: params[:dogTo]) + Message.where(dog_id: params[:dogTo], dog_to: session[:dog_id])
    render json: { messages: @messages.sort{|a,b| a.created_at <=> b.created_at } }
  end

  def create
    params[:dog_id] = 2
    @message = Message.create(params.permit(:dog_to, :dog_id, :message))
    render json: @message
  end

end
class MessagesController < ApplicationController
  def create
    @message = Message.create(params)
    render json: @message
  end
end
class UsersController < ApplicationController
  def show
    if isLoggedIn?
      if session[:user_id]
        @user = User.find_by(id: session[:user_id])
        render json: { user: @user, dog: @user.dog } 
      else
        head 404
      end
    else
      head 403
    end
  end 

  def create
    @user = User.create(params.except(:session).permit(:name, :email,      
    :password_digest, :address_one, :address_two, :city, :zip_code, :state, :lat, :lng))
    cookies[:user_id] = @user.id
    session[:user_id] = @user.id
    render json: @user
  end

  def update
    if isLoggedIn?
      @user = User.find_by(id: session[:user_id]).update(params.except(:user).permit(:name, :email,      
      :password_digest, :address_one, :address_two, :city, :zip_code, :state, :lat, :lng))
      render json: @user
    else
      head 403
    end
  end

  def destroy
    if isLoggedIn?
      Conversation.where(first_user_id: session[:user_id]).destroy_all
      Conversation.where(second_user_id: session[:user_id]).destroy_all
      User.find_by(id: session[:user_id]).destroy
      reset_session
      head 200
    else
      head 403
    end
  end

  def index
    if isLoggedIn?
      @users = User.where.not(id: session[:user_id])
      @users_dogs = @users.map{|user| { user: user, dog: user.dog }}
      render json: { users: @users_dogs }
    else 
      head 403
    end
  end
end
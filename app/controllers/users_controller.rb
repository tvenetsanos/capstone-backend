class UsersController < ApplicationController
  def get_user
    if session[:user_id]
      render json: { user: User.find_by(id: session[:user_id]) }
    else
      head 404
    end
  end 

  def create
    @user = User.create(params)
    render json: @user
  end

  def update
    @user = User.find_by(id: session[:user_id]).update(params)
    render json: @user
  end

  def delete
    User.find_by(id: session[:user_id]).destroy
    head 200
  end

  def users
    @users = Dog.where.not(id: session[:user_id])
    render json: { users: @users }
  end
end
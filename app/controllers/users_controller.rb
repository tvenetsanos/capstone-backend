class UsersController < ApplicationController
  def get_user
    if isLoggedIn?
      if session[:user_id]
        render json: { user: User.find_by(id: session[:user_id]) }
      else
        head 404
      end
    else
      head 403
    end
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

  def delete
    if isLoggedIn?
      User.find_by(id: session[:user_id]).destroy
      reset_session
      head 200
    else
      head 403
    end
  end

  def users
    if isLoggedIn?
      @users = User.where.not(id: session[:user_id])
      @users_dogs = @users.map{|user| { user: user, dog: Dog.find_by(user_id: user.id) }}
      render json: { users: @users_dogs }
    else 
      head 403
    end
  end
end
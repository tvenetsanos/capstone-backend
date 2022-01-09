class SessionsController < ApplicationController
  def check_session
    if isLoggedIn?
      head 200
    else
      head 404
    end
  end
  
  def signup
    @user = User.create(params.except(:session).permit(:name, :email,      
    :password_digest, :address_one, :address_two, :city, :zip_code, :state, :lat, :lng))
    session[:user_id] = @user.id
    render json: @user
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.password_digest == params[:password_digest]
      cookies[:user_id] = @user.id
      session[:user_id] = @user.id
      render json: { session: session, user: @user }
    else
      head 403
    end
  end

  def logout
    reset_session
    head 200
  end
end
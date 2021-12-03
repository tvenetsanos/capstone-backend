require 'pry'
class SessionsController < ApplicationController
  def get_session
    binding.pry
    if session[:dog_id]
      head 200
    else
      head 404
    end
  end 

  def signup
    @dog = Dog.create(params.except(:session).permit(:dog_name, :email,      
    :password_digest, :address_one, :address_two, :city, :zip_code, :state))
    session[:dog_id] = @dog.id
    render json: @dog
  end

  def login
    @dog = Dog.find_by(email: params[:email])
    if @dog && @dog.password_digest == params[:password_digest]
      cookies[:dog_id] = @dog.id
      session[:dog_id] = @dog.id
      render json: { session: session, dog: @dog }
    else
      head 403
    end
  end

  def logout
    session[:dog_id] = nil
    head 200
  end

  def dogs
    @dogs = Dog.all
    render json: { dogs: @dogs }
  end
end
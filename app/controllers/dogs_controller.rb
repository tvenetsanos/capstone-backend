class DogsController < ApplicationController
  def add_dog
    params[:user_id] = session[:user_id]
    @dog = Dog.create(params.except(:dog).permit(:dog_name, :breed, :age, :user_id))
    render json: { dog: @dog }
  end
end
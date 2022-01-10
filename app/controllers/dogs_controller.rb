class DogsController < ApplicationController
  def add_dog
    params[:user_id] = session[:user_id]
    @dog = Dog.create(params.except(:dog).permit(:dog_name, :breed, :age, :user_id))
    render json: { dog: @dog }
  end

  def update
    @dog = Dog.find_by(user_id: session[:user_id]).update(params.except(:dog).permit(:dog_name, :breed, :age))
    render json: { dog: @dog }
  end
end
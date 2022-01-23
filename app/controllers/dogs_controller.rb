class DogsController < ApplicationController
  def create
    params[:user_id] = session[:user_id]
    @dog = Dog.create(params.except(:dog).permit(:dog_name, :breed, :age, :user_id))
    render json: { dog: @dog }
  end

  def update
    @dog = Dog.find_by(id: params[:id]).update(params.except(:dog).permit(:dog_name, :breed, :age))
    render json: { dog: @dog }
  end
end
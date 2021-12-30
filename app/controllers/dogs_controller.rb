class DogController < ApplicationController
  def add_dog
    @dog = Dog.create(params)
    render json @dog
  end
end
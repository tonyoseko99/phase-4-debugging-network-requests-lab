class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.new(toy_params)
    if toy.save
      render json: toy, status: :created
    else
      render json: toy.errors, status: :unprocessable_entity
    end
  end 

  def update
    # update likes only
    toy = Toy.find_by(id: params[:id])
    toy.update(likes: params[:likes])
    render json: toy
  end

  def destroy
    # delete a toy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end

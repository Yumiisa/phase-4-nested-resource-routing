class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find(params[:id])
    reviews=dog_house.reviews
    render json:reviews, inlude: :dog_house
  end
  def reviews
    review=Review.find(params[:id])
    render json:review, inlude: :dog_house
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end

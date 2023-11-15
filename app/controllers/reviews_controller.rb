class ReviewsController < ApplicationController
  before_action :set_review, only: %i[destroy]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, status: :see_other
  end

  private

  def set_review
    @review = review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

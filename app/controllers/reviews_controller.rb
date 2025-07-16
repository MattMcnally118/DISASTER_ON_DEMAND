class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_back fallback_location: root_path, notice: "Review created."
    else
      redirect_back fallback_location: root_path, alert: "Review could not be created. Please try again."
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review, notice: "Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, alert: "Deleted."
  end

  private

  def review_params
    params.require(:review).permit(:booking_id, :rating, :comment)
  end
end

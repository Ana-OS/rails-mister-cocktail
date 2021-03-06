class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @review.user = current_user

    if @review.save
        redirect_to cocktail_path(@cocktail)
    else
        @dose = Dose.new
        render "cocktails/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_user_index_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

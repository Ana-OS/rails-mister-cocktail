class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query].present?
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    # crio @dose para poder o dose/new.html.erb ao cocktail
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
     render :new
    end
  end

  def edit;end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end

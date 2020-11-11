class DosesController < ApplicationController
  before_action :find_dose, only: [:destroy, :edit, :update]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new(dose_params)
   @dose.cocktail = @cocktail

   if @dose.save
    redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:cocktail_id])

  end

  def update
    @cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.update!(dose_params)
      redirect_to cocktail_path(@cocktail)
    else
     render :new
    end
  end


  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

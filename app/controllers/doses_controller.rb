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
   @user = current_user

   if @dose.save
    redirect_to  cocktails_user_index_path( anchor: "anchor-#{@cocktail.id}")
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
      redirect_to  cocktails_user_index_path( anchor: "anchor-#{@cocktail.id}")
    else
     render :new
    end
  end


  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.destroy
    redirect_to  cocktails_user_index_path( anchor: "anchor-#{@cocktail.id}")
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

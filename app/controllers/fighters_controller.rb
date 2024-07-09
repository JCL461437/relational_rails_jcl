class FightersController < ApplicationController
  def index
    # @fighters = Fighter.all not used after us 15
    @fighters = Fighter.only_true
  end

  def edit
    @fighter = Fighter.find(params[:id])
  end

  def update
    fighter = Fighter.find(params[:id])
    fighter.update(fighter_params) #use of fighter_params because just putting params did not work? 
    redirect_to "/fighters/#{fighter.id}"
  end

  def destroy
    # fighter = Fighter.find(params[:id])
    # fighter.destroy

    Fighter.destroy(params[:id])
  
    redirect_to '/fighters'
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  private
    def fighter_params
      params.permit(:name, :age, :style, :active)
    end
end
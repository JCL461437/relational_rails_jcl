class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end

  def edit
    @fighter = Fighter.find(params[:id])
  end

  def update
    fighter = Fighter.find(params[:id])
    fighter.update(:name, :age, :style, :active) #use of gym_params below instead of the long one above to visualize difference
    redirect_to "/fighters/#{fighter.id}"
  end

  def show
    @fighter = Fighter.find(params[:id])
  end
  
end
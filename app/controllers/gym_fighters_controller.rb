class GymFightersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    if params[:order].present? # use conditional to check if :order is present in the params, send through with query params syntax
      @fighters = @gym.fighters.order(:name)
    else
      @fighters = @gym.fighters #if order is not present in query params then it will list the fighters in order or create_at like before
    end
  end

  def new
    @gym = Gym.find(params[:id])
  end
  
  def create
    @gym = Gym.find(params[:id])
    @new_fighter = Fighter.create({ name: params[:name], age: params[:age],
    style: params[:style], active: params[:active], gym: @gym}) 
    # you could do this long params or use the strong params option
    
    @new_fighter.save # redundant, create does both new and save
    
    redirect_to "/gyms/#{@gym.id}/fighters"
  end
end
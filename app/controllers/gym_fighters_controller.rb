class GymFightersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @fighters = @gym.fighters
  end

  def new
    @gym = Gym.find(params[:id])
  end
  
  def create
    @gym = Gym.find(params[:id])
    @new_fighter = Fighter.create({ name: params[:name], age: params[:age],
    style: params[:style], active: params[:active], gym: @gym}) 
    # you could do this long params or use the strong params option
    
    @new_fighter.save
    
    redirect_to "/gyms/#{@gym.id}/fighters"
  end
end
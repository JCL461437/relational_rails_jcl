class GymFightersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @fighters = @gym.fighters
  end

  def new
  end
  
  def create
    @gym = Gym.find(params[:id])
    @new_fighter = @gym.fighter.create({ name: params[:name], number_of_champions: params[:number_of_champions],
    holds_current_champion: params[:holds_current_champion]}) 
    # you could do this long params or use the strong params option
    
    @new_fighter.save
    
    redirect_to "/gyms/#{@gym.id}/fighters"
  end
end
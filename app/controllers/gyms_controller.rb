class GymsController < ApplicationController
  def index
    @gyms = Gym.order(created_at: :desc)
    @gyms = Gym.all
  end

  
  def new
  end
  
  def create
    @new_gym = Gym.create({ name: params[:name], number_of_champions: params[:number_of_champions],
    holds_current_champion: params[:holds_current_champion]}) 
    # you could do this long params or use the strong params option
    
    @new_gym.save
    
    redirect_to "/gyms"
  end
  
  def show
    @gym = Gym.find(params[:id])
    @fighter_count = @gym.fighters.count
  end

  private 
    def gym_params
      params.permit(:name, :number_of_champions, :holds_current_champion)
    end

    def gym_id_param
      params.permit(:id)
    end

end
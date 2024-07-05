class GymFightersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @fighters = @gym.fighters
  end
end
class GymsController < ApplicationController
  def index
    @gyms = Gym.order(created_at: :desc) #asc 
  end

  def show
    @gym = Gym.find(params[:id])
  end
end
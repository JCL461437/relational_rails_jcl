class GymsController < ApplicationController
  def index
    @gyms = Gym.order(created_at: :desc)
  end

  def show
    @gym = Gym.find(params[:id])
  end
end
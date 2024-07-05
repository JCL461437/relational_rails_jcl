class GymFightersController < ApplicationController
  def index
    @gyms = Gym.all
    @fighters = @gyms.fighters.all
  end

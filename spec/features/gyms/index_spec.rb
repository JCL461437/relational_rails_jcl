require "rails_helper"

RSpec.describe 'Gyms index' do

  before :each do
    @akasj = Gym.create!(name: "American Kickboxing Academy, San Jose")
    @tmmaf = Gym.create!(name: "Texeira MMA & Fitness")
    @topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek")
    @sbgire = Gym.create!(name: "Straight Blast Gym, Ireland")
  end

  describe 'as a visitor' do
    describe 'when I visit /gyms' do 
      it 'displays the name of each parent record in the system' do
        
        visit "/gyms"

        expect(page).to have_content("American Kickboxing Academy, San Jose")
        expect(page).to have_content("Texeira MMA & Fitnesse")
        expect(page).to have_content("American Top Team, Cocunut Creek")
        expect(page).to have_content("'Straight Blast Gym, Ireland")
      end
    end
  end
end
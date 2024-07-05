require "rails_helper"

RSpec.describe 'Gyms index' do

  before :each do
    @akasj = Gym.create!(name: "American Kickboxing Academy, San Jose", number_of_champions: 6, holds_current_champion: true)
    @tmmaf = Gym.create!(name: "Texeira MMA & Fitness",  number_of_champions: 2, holds_current_champion: true)
    @topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek",  number_of_champions: 6, holds_current_champion: true)
    @sbgire = Gym.create!(name: "Straight Blast Gym, Ireland",  number_of_champions: 1, holds_current_champion: false)
  end

  describe 'as a visitor' do
    describe 'when I visit /gyms' do 
      it 'displays the name of each parent record in the system' do
        
        visit "/gyms"

        expect(page).to have_content("American Kickboxing Academy, San Jose")
        expect(page).to have_content("Texeira MMA & Fitness")
        expect(page).to have_content("American Top Team, Cocunut Creek")
        expect(page).to have_content("Straight Blast Gym, Ireland")

        # save_and_open_page
      end

      xit 'display the records ordered by most recently created' do
        
        visit "/gyms"
        
        within ("#gym-#{@akasj.id}") do
          expect(page).to have_content("American Kickboxing Academy, San Jose")
          
        end

          expect(page).to have_content("Texeira MMA & Fitness")
          expect(page).to have_content("American Top Team, Cocunut Creek")
          expect(page).to have_content("Straight Blast Gym, Ireland")

        #how to test order? shovel records in array and make sure index 0 is the most recently created at?
      end
    end
  end
end
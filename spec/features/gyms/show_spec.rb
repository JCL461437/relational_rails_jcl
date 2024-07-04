require "rails_helper"

RSpec.describe 'Gyms show' do
  
  before :each do
    @akasj = Gym.create!(name: "American Kickboxing Academy, San Jose", number_of_champions: 6, holds_current_champion: true)
    @tmmaf = Gym.create!(name: "Texeira MMA & Fitness",  number_of_champions: 2, holds_current_champion: true)
    @topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek",  number_of_champions: 6, holds_current_champion: true)
    @sbgire = Gym.create!(name: "Straight Blast Gym, Ireland",  number_of_champions: 1, holds_current_champion: false)
  end

  describe 'as a visitor' do
    describe 'when I visit /gyms/:id' do 
      it 'displays the gyms with its id and attributes' do
        
        visit "/gyms/#{@akasj.id}"

        expect(page).to have_content("American Kickboxing Academy, San Jose")
        expect(page).to have_content("Gym ID: #{@akasj.id}")
        expect(page).to have_content("Number of UFC Champions: 6")
        expect(page).to have_content("Holds Current UFC Champion: Yes")

        expect(page).to_not have_content("Texeira MMA & Fitness")
        expect(page).to_not have_content("Gym ID: #{@tmmaf.id}")
        expect(page).to_not have_content("Number of UFC Champions: 2")
        expect(page).to_not have_content("Holds Current UFC Champion: Yes")
        # save_and_open_page
      end
    end
end

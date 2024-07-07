require "rails_helper"

RSpec.describe 'Gyms New' do

  before :each do
    @akasj = Gym.create!(name: "American Kickboxing Academy, San Jose", number_of_champions: 6, holds_current_champion: true)
    @tmmaf = Gym.create!(name: "Texeira MMA & Fitness",  number_of_champions: 2, holds_current_champion: true)
    @topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek",  number_of_champions: 6, holds_current_champion: true)
    @sbgire = Gym.create!(name: "Straight Blast Gym, Ireland",  number_of_champions: 1, holds_current_champion: false)
  end

  describe 'as a visitor' do
    describe 'when I visit /gyms' do 
      it 'displays a link to create a new gym' do
        
        visit "/gyms"

        expect(page).to have_link("New Gym")
      end

      it 'takes bring the user to /gyms/new when New Gym link is clicked' do
        visit "/gyms"

        expect(page).to have_link("New Gym")

        click_link "New Gym"
        expect(page).to have_current_path("/gyms/new")

      end

      it 'the user can fill out a form with a new gyms attributes and can submit it' do
        visit "/gyms/new"

        within ("#new-gym") do
          fill_in 'name', with: 'Allstars Training Center'
          fill_in 'number_of_champions', with: '0'
          fill_in 'holds_current_champion', with: 'false'

          click_button "Create Gym"
        end

        new_gym_name = Gym.last.name # use that to see what the last gym that was created information is
        expect(page).to have_current_path("/gyms")
        expect(page).to have_content(new_gym_name)

      end
    end
  end
end
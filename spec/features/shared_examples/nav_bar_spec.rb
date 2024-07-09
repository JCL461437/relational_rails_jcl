require "rails_helper"

RSpec.describe 'Nav Bar' do

  describe 'as a visitor' do
    describe 'when I visit /gyms/:id' do 

      it 'has a link to go back to the fighter and gym index pages' do

        visit "/gyms"

        expect(page).to have_link("Gyms Index Page")
        click_link "Gyms Index Page"
        expect(page).to have_current_path("/gyms")

        expect(page).to have_link("Fighters Index Page")
        click_link "Fighters Index Page"
        expect(page).to have_current_path("/fighters")
      end
    end
  end
end

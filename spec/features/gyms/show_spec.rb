require "rails_helper"

RSpec.describe 'Gyms show' do
  
  before :each do
    @akasj = Gym.create!(name: "American Kickboxing Academy, San Jose", number_of_champions: 6, holds_current_champion: true)
    @tmmaf = Gym.create!(name: "Texeira MMA & Fitness",  number_of_champions: 2, holds_current_champion: true)
    @topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek",  number_of_champions: 6, holds_current_champion: true)
    @sbgire = Gym.create!(name: "Straight Blast Gym, Ireland",  number_of_champions: 1, holds_current_champion: false)

    @khabib = Fighter.create!(name: "Khabib Nurmagomedov", age: 35, style: "Combat Sambo", active: false, gym: @akasj)
    @islam = Fighter.create!(name: "Islam Makhachev", age: 32, style: "Combat Sambo", active: true, gym: @akasj)
    @dc = Fighter.create!(name: "Daniel Cormier", age: 45, style: "Wrestling", active: false, gym: @akasj)
    @leon = Fighter.create!(name: "Leon Edwards", age: 32, style: "Striker", active: true, gym: @akasj)
    @teixeira = Fighter.create!(name: "Glover Teixeira", age: 44, style: "Brazilian Jiu-Jitsu", active: false, gym: @tmmaf)
    @pereira = Fighter.create!(name: "Alex Pereira", age: 37, style: "Kickboxing", active: true, gym: @tmmaf)
    @pantoja = Fighter.create!(name: "Alexandre Patoja", age: 34, style: "Brazilian Jiu-Jitsu", active: true, gym: @topteamfl)
    @woodley = Fighter.create!(name: "Tyron Woodley", age: 42, style: "Wrestling", active: false, gym: @topteamfl)
    @yoel = Fighter.create!(name: "Yoel Romero", age: 47, style: "Wrestling", active: false, gym: @topteamfl)
    @evloev = Fighter.create!(name: "Movsar Evloev", age: 30, style: "Freestyle", active: true, gym: @sbgire)
  end

  describe 'as a visitor' do
    describe 'when I visit /gyms/:id' do 

      it 'has a link to go back to the fighter and gym index pages' do
        visit "/gyms/#{@akasj.id}"

        expect(page).to have_link("Gyms Index Page")
        click_link "Gyms Index Page"
        expect(page).to have_current_path("/gyms")

        expect(page).to have_link("Fighters Index Page")
        click_link "Fighters Index Page"
        expect(page).to have_current_path("/fighters")
      end

      it 'displays the gyms with its id and attributes' do
        
        visit "/gyms/#{@akasj.id}"

        expect(page).to have_content("American Kickboxing Academy, San Jose")
        expect(page).to have_content("Gym ID: #{@akasj.id}")
        expect(page).to have_content("Number of UFC Champions: 6")
        expect(page).to have_content("Holds Current UFC Champion: true")

        expect(page).to_not have_content("Straight Blast Gym, Ireland")
        expect(page).to_not have_content("Gym ID: #{@sbgire.id}")
        expect(page).to_not have_content("Number of UFC Champions: 1")
        expect(page).to_not have_content("Holds Current UFC Champion: false")
        # save_and_open_page
      end

      it 'displays the number of children associated with the parent' do
        
        visit "/gyms/#{@akasj.id}"

        expect(page).to have_content("Number of Fighters: 4")
        # save_and_open_page
      end

      it 'displays a link to take me to the /gyms/:id/fighters page' do
        
        visit "/gyms/#{@akasj.id}"

        expect(page).to have_link("Gym Fighters Index Page")
        click_link "Gym Fighters Index Page"
        expect(page).to have_current_path("/gyms/#{@akasj.id}/fighters")
      end
    end
  end
end

require "rails_helper"

RSpec.describe 'Gym/Fighters New' do

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
    @pereira = Fighter.create!(name: "Alex Pereira", age: 37, style: "Kickboxing", active: false, gym: @tmmaf)
    @pantoja = Fighter.create!(name: "Alexandre Patoja", age: 34, style: "Brazilian Jiu-Jitsu", active: true, gym: @topteamfl)
    @woodley = Fighter.create!(name: "Tyron Woodley", age: 42, style: "Wrestling", active: false, gym: @topteamfl)
    @yoel = Fighter.create!(name: "Yoel Romero", age: 47, style: "Wrestling", active: false, gym: @topteamfl)
    @evloev = Fighter.create!(name: "Movsar Evloev", age: 30, style: "Freestyle", active: true, gym: @topteamfl)
    @conor = Fighter.create!(name: "Conor McGregor", age: 35, style: "Striker", active: false, gym: @sbgire)
  end

  describe 'as a visitor' do
    describe 'when I visit /gyms/:id/fighters' do 
      it 'displays a link to create a new gym' do
        
        visit "/gyms/#{@akasj.id}/fighters"

        expect(page).to have_link("Create Fighter")
      end

      it 'takes bring the user to /gyms/:id/fighter/new when Create Fighter link is clicked' do
        visit "/gyms/#{@akasj.id}/fighters"

        expect(page).to have_link("Create Fighter")

        click_link "Create Fighter"
        expect(page).to have_current_path("/gyms/#{@akasj.id}/fighters/new")

      end

      it 'the user can fill out a form with a new fighter attributes and can submit it for it to be displayed on the gyms/:id/fighter index page' do
        visit "/gyms/#{@akasj.id}/fighters/new"

        within ("#new-fighter") do
          fill_in 'name', with: 'Luke Rockhold'
          fill_in 'age', with: 39
          fill_in 'style', with: 'Brazilian Jiu-Jitsu'
          fill_in 'active', with: 'false'

          click_button "Create Fighter"
        end

        expect(page).to have_current_path("/gyms/#{@akasj.id}/fighters")
        expect(page).to have_content("Luke Rockhold")
        expect(page).to have_content("Fighter Age: 39")
        expect(page).to have_content("Fighting Style: Brazilian Jiu-Jitsu")
        expect(page).to have_content("Currently Active: false")
      end
    end
  end
end
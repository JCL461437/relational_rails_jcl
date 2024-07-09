require "rails_helper"

RSpec.describe 'Fighter index' do

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
    @evloev = Fighter.create!(name: "Movsar Evloev", age: 30, style: "Freestyle", active: true, gym: @topteamfl)
    @conor = Fighter.create!(name: "Conor McGregor", age: 35, style: "Striker", active: false, gym: @sbgire)
  end

  describe 'as a visitor' do
    describe 'when I visit /fighters' do 
      it 'displays the name of each fighter in the system including each fighters attributes' do
        
        visit "/fighters"

        within ("#fighter-#{@pereira.id}") do
          expect(page).to have_content(@pereira.name)
          expect(page).to have_content("Fighter Age: #{@pereira.age}")
          expect(page).to have_content("Fighting Style: #{@pereira.style}")
          expect(page).to have_content("Currently Active: #{@pereira.active}")

          expect(page).to_not have_content(@evloev.name)
        end
      end

      it 'display an update link specific to the fighter next to each fighter' do
        
        visit "/fighters"
        
        # within block not working? 
        within ("#fighter-#{@pereira.id}") do
          expect(page).to have_content("Alex Pereira")
          expect(page).to_not have_content("Glover Texeira")

          click_link "Update #{@pereira.name}"
        end

        expect(page).to have_current_path("/fighters/#{@pereira.id}/edit")
      end

      it 'can edit the fighter' do

        visit "/fighters"

        expect(page).to have_content(37)

        click_link "Update #{@pereira.name}"

        expect(current_path).to eq("/fighters/#{@pereira.id}/edit")

        fill_in 'name', with: 'Alex Pereira'
        fill_in 'age', with: 36
        fill_in 'style', with: 'Kickboxing'
        fill_in 'active', with: 'true'

        click_button 'Update Fighter'

        expect(current_path).to eq("/fighters/#{@pereira.id}")
        expect(page).to have_content(36)
        expect(page).to_not have_content(37)
      end
    end
  end
end
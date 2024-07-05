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
    @pereira = Fighter.create!(name: "Alex Pereira", age: 37, style: "Kickboxing", active: false, gym: @tmmaf)
    @pantoja = Fighter.create!(name: "Alexandre Patoja", age: 34, style: "Brazilian Jiu-Jitsu", active: true, gym: @topteamfl)
    @woodley = Fighter.create!(name: "Tyron Woodley", age: 42, style: "Wrestling", active: false, gym: @topteamfl)
    @yoel = Fighter.create!(name: "Yoel Romero", age: 47, style: "Wrestling", active: false, gym: @topteamfl)
    @evloev = Fighter.create!(name: "Movsar Evloev", age: 30, style: "Freestyle", active: true, gym: @topteamfl)
  end

  describe 'as a visitor' do
    describe 'when I visit /fighters' do 
      it 'displays the name of each fighter in the system including each fighters attributes' do
        
        visit "/fighters"

        within ("#fighter-#{@khabib.id}") do
          expect(page).to have_content(@khabib.name)
          expect(page).to have_content("Fighter Age: #{@khabib.age}")
          expect(page).to have_content("Fighting Style: #{@khabib.style}")
          expect(page).to have_content("Currently Active: #{@khabib.active}")

          expect(page).to_not have_content(@evloev.name)
        end

      end
    end
  end
end
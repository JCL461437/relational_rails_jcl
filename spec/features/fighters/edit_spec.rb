require 'rails_helper'

RSpec.describe 'the Fighters edit' do
  
  before :each do
    @akasj = Gym.create!(name: "American Kickboxing Academy, San Bernadino", number_of_champions: 5, holds_current_champion: false)
    @tmmaf = Gym.create!(name: "Texeira MMA & Fitness",  number_of_champions: 2, holds_current_champion: true)
    @topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek",  number_of_champions: 6, holds_current_champion: true)
    @sbgire = Gym.create!(name: "Straight Blast Gym, Ireland",  number_of_champions: 1, holds_current_champion: false)

    @khabib = Fighter.create!(name: "Kabib Nurmagomedov", age: 35, style: "Dagestani", active: false, gym: @akasj)
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

  it 'has a link to the edit page from the fighter show page' do

    visit "/fighters/#{@khabib.id}"

    click_link "Update Fighter"

    expect(current_path).to eq("/fighter/#{@khabib.id}/edit")
  end

  it 'can edit the fighter' do

    visit "/fighters/#{@khabib.id}"

    expect(page).to have_content('Kabib')

    click_link "Update Fighter"

    expect(current_path).to eq("/fighters/#{@khabib.id}/edit")

    fill_in 'name', with: 'Khabib Nurmagomedov'
    fill_in 'age', with: 35
    fill_in 'style', with: 'Combat Sambo'
    fill_in 'active', with: 'false'

    click_button 'Update Fighter'

    expect(current_path).to eq("/fighters/#{@khabib.id}")
    expect(page).to have_content("Khabib Khabib Nurmagomedov")
    expect(page).to have_content("Fighting Style: Combat Sambo")
  end
end
require 'rails_helper'

RSpec.describe 'the Gyms edit' do
  
  before :each do
    @akasj = Gym.create!(name: "American Kickboxing Academy, San Bernadino", number_of_champions: 5, holds_current_champion: false)
    @tmmaf = Gym.create!(name: "Texeira MMA & Fitness",  number_of_champions: 2, holds_current_champion: true)
    @topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek",  number_of_champions: 6, holds_current_champion: true)
    @sbgire = Gym.create!(name: "Straight Blast Gym, Ireland",  number_of_champions: 1, holds_current_champion: false)
  end

  it 'has a link to the edit page from the gym show page' do

    visit "/gyms/#{@akasj.id}"

    click_link "Update Gym"

    expect(current_path).to eq("/gyms/#{@akasj.id}/edit")
  end

  it 'can edit the gym' do

    visit "/gyms/#{@akasj.id}"

    expect(page).to have_content('San Bernadino')

    click_link "Update Gym"

    expect(current_path).to eq("/gyms/#{@akasj.id}/edit")

    fill_in 'name', with: 'American Kickboxing Academy, San Jose'
    fill_in 'number_of_champions', with: '6'
    fill_in 'holds_current_champion', with: 'true'

    click_button 'Update Gym'

    expect(current_path).to eq("/gyms/#{@akasj.id}")
    expect(page).to have_content("American Kickboxing Academy, San Jose")
  end
end
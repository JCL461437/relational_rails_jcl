# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Gym.destroy_all
Fighter.destroy_all

akasj = Gym.create!(name: "American Kickboxing Academy, San Jose", number_of_champions: 6, holds_current_champion: true)
tmmaf = Gym.create!(name: "Texeira MMA & Fitness",  number_of_champions: 2, holds_current_champion: true)
topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek",  number_of_champions: 6, holds_current_champion: true)
sbgire = Gym.create!(name: "Straight Blast Gym, Ireland",  number_of_champions: 1, holds_current_champion: false)

khabib = Fighter.create!(name: "Khabib Nurmagomedov", age: 35, style: "Combat Sambo", active: false, gym: akasj)
islam = Fighter.create!(name: "Islam Makhachev", age: 32, style: "Combat Sambo", active: true, gym: akasj)
dc = Fighter.create!(name: "Daniel Cormier", age: 45, style: "Wrestling", active: false, gym_: akasj)
leon = Fighter.create!(name: "Leon Edwards", age: 32, style: "Striker", active: true, gym: akasj)

teixeira = Fighter.create!(name: "Glover Teixeira", age: 44, style: "Brazilian Jiu-Jitsu", active: false, gym: tmmaf)
pereira = Fighter.create!(name: "Alex Pereira", age: 37, style: "Kickboxing", active: false, gym: tmmaf)

pantoja = Fighter.create!(name: "Alexandre Patoja", age: 34, style: "Brazilian Jiu-Jitsu", active: true, gym: topteamfl)
woodley = Fighter.create!(name: "Tyron Woodley", age: 42, style: "Wrestling", active: false, gym: topteamfl)
yoel = Fighter.create!(name: "Yoel Romero", age: 47, style: "Wrestling", active: false, gym: topteamfl)
evloev = Fighter.create!(name: "Movsar Evloev", age: 30, style: "Freestyle", active: true, gym: topteamfl)

conor = Fighter.create!(name: "Conor McGregor", age: 35, style: "Striker", active: false, gym: sbgire)

puts ""
puts "Successfully seeded."
puts ""
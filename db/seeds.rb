# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

akasj = Gym.create!(name: "American Kickboxing Academy, San Jose")
tmmaf = Gym.create!(name: "Texeira MMA & Fitness")
topteamfl = Gym.create!(name: "American Top Team, Cocunut Creek")
sbgire = Gym.create!(name: "Straight Blast Gym, Ireland")

puts "Successfully seeded."
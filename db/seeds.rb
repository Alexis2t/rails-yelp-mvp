# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

7.times.each do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.address = Faker::Address.full_address
  restaurant.phone_number = Faker::PhoneNumber.cell_phone
  restaurant.category = %w[chinese italian japanese french belgian].sample
  restaurant.save

  3.times.each do
    review = Review.new
    review.rating = rand(1..5)
    review.content = Faker::Restaurant.review
    review.restaurant = restaurant
    review.save
  end
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[ "NYC", "SFO", "AAA", "YMC", "XQC" ].each do |airport_code|
  Airport.find_or_create_by!(code: airport_code)
end

DAYS = 7
HOURS = 3

Airport.all.each do |departure|
  Airport.all.each do |arrival|
    DAYS.times do |d|
      HOURS.times do |h|
        Flight.find_or_create_by!(departure_airport_id: departure.id, arrival_airport_id: arrival.id, start: DateTime.new(2024, 9, 6+d, h+Random.rand(21)), duration: Random.rand(10.0).round(1))
      end
    end
  end
end

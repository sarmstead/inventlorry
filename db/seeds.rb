# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
base_password = Rails.application.credentials.dig(:user, :base, :password)
scooter = User.find_or_initialize_by(first_name: "Scooter", last_name: "Tooter", email_address: "scootertooter@inventlorry.com")
scooter.password = base_password
scooter.save!
puts "Created #{scooter.full_name}'s account" if scooter.valid?

# Organizations
sure_ships_alot = Organization.find_or_create_by(name: "Sure Ships Alot")
puts "Created #{sure_ships_alot.name}'s organization" if sure_ships_alot.valid?

# Memberships
scooter_with_sure_ships_alot = Membership.find_or_create_by(user: scooter, organization: sure_ships_alot, role: "admin")
puts "Assigned #{scooter.full_name} to #{sure_ships_alot.name}'s organization as an #{scooter_with_sure_ships_alot.role}" if scooter_with_sure_ships_alot.valid?

# Makes
make_international = Make.find_or_create_by!(name: "International", organization: sure_ships_alot)
make_kenworth = Make.find_or_create_by!(name: "Kenworth", organization: sure_ships_alot)
make_volvo = Make.find_or_create_by!(name: "Volvo", organization: sure_ships_alot)
make_peterbilt = Make.find_or_create_by!(name: "Peterbilt", organization: sure_ships_alot)
make_mack = Make.find_or_create_by!(name: "Mack", organization: sure_ships_alot)

[ make_international, make_kenworth, make_volvo, make_peterbilt, make_mack ].each { |make| puts "Created make: #{make.name}" if make.valid? }

# Models
model_international_lt = Model.find_or_create_by!(name: "International LT", make: make_international, organization: sure_ships_alot)
model_international_rh = Model.find_or_create_by!(name: "International RH", make: make_international, organization: sure_ships_alot)
[ model_international_lt, model_international_rh ].each { |model| puts "Created model: #{model.name}" if model.valid? }

# Trims
trim_international_lt_classic = Trim.find_or_create_by!(name: "Classic", model: model_international_lt, organization: sure_ships_alot)
trim_international_lt_diamond = Trim.find_or_create_by!(name: "Diamond", model: model_international_lt, organization: sure_ships_alot)
trim_international_lt_diamond_elite = Trim.find_or_create_by!(name: "Diamond Elite", model: model_international_lt, organization: sure_ships_alot)
trim_international_rh_classic = Trim.find_or_create_by!(name: "Classic", model: model_international_rh, organization: sure_ships_alot)
trim_international_rh_diamond = Trim.find_or_create_by!(name: "Diamond", model: model_international_rh, organization: sure_ships_alot)
trim_international_rh_diamond_elite = Trim.find_or_create_by!(name: "Diamond Elite", model: model_international_rh, organization: sure_ships_alot)
[ trim_international_lt_classic,
  trim_international_lt_diamond,
  trim_international_lt_diamond_elite,
  trim_international_rh_classic,
  trim_international_rh_diamond_elite,
  trim_international_rh_diamond_elite
].each { |trim| puts "Created trim: #{trim.name} for model: #{trim.model.name}" if trim.valid? }

# Vehicles
the_inventlorry = Vehicle.find_or_create_by!(name: "The Inventlorry", make: make_international, model: model_international_lt, trim: trim_international_lt_classic, organization: sure_ships_alot)
swagger_vagon = Vehicle.find_or_create_by!(name: "Swagger Vagon", make: make_international, model: model_international_lt, trim: trim_international_lt_diamond, organization: sure_ships_alot)
grand_tour = Vehicle.find_or_create_by!(name: "Grand Tour", make: make_international, model: model_international_lt, trim: trim_international_lt_diamond_elite, organization: sure_ships_alot)
rovie_rivitters = Vehicle.find_or_create_by!(name: "Rovie Rivitters", make: make_international, model: model_international_rh, trim: trim_international_rh_classic, organization: sure_ships_alot)
dr_internationale = Vehicle.find_or_create_by!(name: "Dr. Internationale", make: make_international, model: model_international_rh, trim: trim_international_rh_diamond, organization: sure_ships_alot)
humungo = Vehicle.find_or_create_by!(name: "Humungo", make: make_international, model: model_international_rh, trim: trim_international_rh_diamond_elite, organization: sure_ships_alot)
[ the_inventlorry,
  swagger_vagon,
  grand_tour,
  rovie_rivitters,
  dr_internationale,
  humungo
].each { |vehicle| puts "Created vehicle: #{vehicle.name}" if vehicle.valid? }

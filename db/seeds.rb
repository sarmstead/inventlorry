# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Makes
make_international = Make.find_or_create_by!(name: "International")
make_kenworth = Make.find_or_create_by!(name: "Kenworth")
make_volvo = Make.find_or_create_by!(name: "Volvo")
make_peterbilt = Make.find_or_create_by!(name: "Peterbilt")
make_mack = Make.find_or_create_by!(name: "Mack")

# Models
model_international_lt = Model.find_or_create_by!(name: "International LT", make: make_international)
model_international_rh = Model.find_or_create_by!(name: "International RH", make: make_international)

# Trims
trim_international_lt_classic = Trim.find_or_create_by!(name: "Classic (LT)", model: model_international_lt)
trim_international_lt_diamond = Trim.find_or_create_by!(name: "Diamond (LT)", model: model_international_lt)
trim_international_lt_diamond_elite = Trim.find_or_create_by!(name: "Diamond Elite (LT)", model: model_international_lt)
trim_international_rh_classic = Trim.find_or_create_by!(name: "Classic (RH)", model: model_international_rh)
trim_international_rh_diamond = Trim.find_or_create_by!(name: "Diamond (RH)", model: model_international_rh)
trim_international_rh_diamond_elite = Trim.find_or_create_by!(name: "Diamond Elite (RH)", model: model_international_rh)

# Vehicles
Vehicle.find_or_create_by!(name: "The Inventlorry", make: make_international, model: model_international_lt, trim: trim_international_lt_classic)
Vehicle.find_or_create_by!(name: "Swagger Vagon", make: make_international, model: model_international_lt, trim: trim_international_lt_diamond)
Vehicle.find_or_create_by!(name: "Grand Tour", make: make_international, model: model_international_lt, trim: trim_international_lt_diamond_elite)
Vehicle.find_or_create_by!(name: "Rovie Rivitters", make: make_international, model: model_international_rh, trim: trim_international_rh_classic)
Vehicle.find_or_create_by!(name: "Dr. Internationale", make: make_international, model: model_international_rh, trim: trim_international_rh_diamond)
Vehicle.find_or_create_by!(name: "Humungo", make: make_international, model: model_international_rh, trim: trim_international_rh_diamond_elite)

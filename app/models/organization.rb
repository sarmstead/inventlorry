class Organization < ApplicationRecord
  has_many :makes
  has_many :models
  has_many :trims
  has_many :vehicles
end

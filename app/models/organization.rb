class Organization < ApplicationRecord
  has_many :makes
  has_many :models
  has_many :trims
  has_many :vehicles
  has_many :users, through: :memberships
end

class Model < ApplicationRecord
  has_many :trims
  has_many :vehicles
end

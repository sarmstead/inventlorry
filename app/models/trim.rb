class Trim < ApplicationRecord
  belongs_to :model
  has_many :vehicles
end

class Trim < ApplicationRecord
  has_many :vehicles

  belongs_to :model
  belongs_to :organization
end

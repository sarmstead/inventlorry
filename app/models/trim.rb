class Trim < ApplicationRecord
  has_many :vehicles

  belongs_to :model
  belongs_to :organization

  validates :name, presence: true
end

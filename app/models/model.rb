class Model < ApplicationRecord
  has_many :trims, dependent: :destroy
  has_many :vehicles

  belongs_to :make

  scope :with_trims, -> { joins(:trims).distinct }
end

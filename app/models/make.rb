class Make < ApplicationRecord
  has_many :models, dependent: :destroy
  has_many :vehicles

  belongs_to :organization

  scope :with_models, -> { joins(:models).distinct }

  validates :name, presence: true
end

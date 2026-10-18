class Make < ApplicationRecord
  has_many :models, dependent: :destroy
  has_many :vehicles

  scope :with_models, -> { joins(:models).distinct }
end

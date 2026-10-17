class Make < ApplicationRecord
  has_many :models, dependent: :destroy
  has_many :vehicles
end

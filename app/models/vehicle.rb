class Vehicle < ApplicationRecord
  belongs_to :make
  belongs_to :model
  belongs_to :trim

  validate :model_and_trim_must_relate

  private

  def model_and_trim_must_relate
    unless model.trims.include?(trim)
      errors.add(:trim, "must belong to the correct model")
    end
  end
end

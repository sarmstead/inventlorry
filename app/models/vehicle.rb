class Vehicle < ApplicationRecord
  belongs_to :make
  belongs_to :model
  belongs_to :trim
  belongs_to :organization

  validates :name, presence: true

  validate :model_and_trim_must_relate
  validate :all_properties_belong_to_vehicle_organization

  private

  def model_and_trim_must_relate
    unless model.trims.include?(trim)
      errors.add(:trim, "must belong to the correct model")
    end
  end

  def all_properties_belong_to_vehicle_organization
    [ make, model, trim ].each do |property|
      unless property.organization_id == organization_id
        errors.add(:base, "#{property.model_name} must belong to vehicle's organization")
      end
    end
  end
end

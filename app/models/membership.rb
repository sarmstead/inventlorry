class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  enum :role, [ :admin, :editor, :viewer ]

  validates :user_id, uniqueness: {
    scope: :organization_id,
    message: "already belongs to this organization"
  }
end

class CreateMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :organization, null: false, foreign_key: true
      t.integer :role, null: false

      t.timestamps
    end
    add_index :memberships, [:user_id, :organization_id], unique: true
  end
end

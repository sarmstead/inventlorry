class CreateOrganizations < ActiveRecord::Migration[8.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_reference :makes, :organization, null: false, foreign_key: true
    add_reference :models, :organization, null: false, foreign_key: true
    add_reference :trims, :organization, null: false, foreign_key: true
    add_reference :vehicles, :organization, null: false, foreign_key: true
  end
end

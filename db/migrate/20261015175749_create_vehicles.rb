class CreateVehicles < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.belongs_to :make, null: false
      t.belongs_to :model, null: false
      t.belongs_to :trim, null: false

      t.timestamps
    end
  end
end

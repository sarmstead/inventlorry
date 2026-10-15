class CreateTrims < ActiveRecord::Migration[8.1]
  def change
    create_table :trims do |t|
      t.string :name
      t.belongs_to :model, null: false

      t.timestamps
    end
  end
end

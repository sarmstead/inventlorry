class MakeHasManyModels < ActiveRecord::Migration[8.1]
  def change
    add_reference :models, :make, null: false, foreign_key: true
  end
end

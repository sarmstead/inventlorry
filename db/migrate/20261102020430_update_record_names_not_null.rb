class UpdateRecordNamesNotNull < ActiveRecord::Migration[8.1]
  def change
    change_column_null :makes, :name, false
    change_column_null :models, :name, false
    change_column_null :trims, :name, false
    change_column_null :vehicles, :name, false
  end
end

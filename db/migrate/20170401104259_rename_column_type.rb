class RenameColumnType < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :type, :car_type
  end
end

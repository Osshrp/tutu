class AddSortToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :sort, :boolean
  end
end

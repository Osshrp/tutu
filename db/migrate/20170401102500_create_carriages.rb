class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :number
      t.integer :upper_places
      t.integer :bottom_places

      t.timestamps
    end
  end
end

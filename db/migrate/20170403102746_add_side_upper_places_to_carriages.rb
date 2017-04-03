class AddSideUpperPlacesToCarriages < ActiveRecord::Migration[5.0]
  def change
    add_column :carriages, :side_upper_places, :integer
    add_column :carriages, :side_bottom_places, :integer
    add_column :carriages, :type, :string
  end
end

class AddTrainToCarriages < ActiveRecord::Migration[5.0]
  def change
    add_reference :carriages, :train, foreign_key: true
  end
end

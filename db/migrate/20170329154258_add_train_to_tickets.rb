class AddTrainToTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :train, foreign_key: true
  end
end

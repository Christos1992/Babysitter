class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.boolean :status, default: false
      t.references :parent, foreign_key: true
      t.references :bbsitter, foreign_key: true




      t.timestamps
    end
  end
end

class CreateBbsitters < ActiveRecord::Migration[5.2]
  def change
    create_table :bbsitters do |t|
      t.string :first_name
      t.string :last_name
      t.string :language
      t.integer :price
      t.integer :age
      t.string :city
      t.text :description
      t.string :photo
      t.integer :experience
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

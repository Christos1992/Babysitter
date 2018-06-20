class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :parent_id
      t.integer :bbsitter_id

      t.timestamps
    end
  end
end

class AddConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.integer :first_user
      t.integer :second_user

      t.timestamps
    end
  end
end

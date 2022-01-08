class AddMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.string :user_id
      t.string :conversation_id

      t.timestamps
    end
  end
end

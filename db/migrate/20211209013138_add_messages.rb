class AddMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message

      t.timestamps
    end
  end
end

class AddDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.string :breed
      t.integer :age
      t.integer :user_id

      t.timestamps
    end
  end
end

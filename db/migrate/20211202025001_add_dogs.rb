class AddDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end

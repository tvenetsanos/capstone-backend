class AddDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.string :password_digest
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :zip_code
      t.string :state
      t.string :email

      t.timestamps
    end
  end
end

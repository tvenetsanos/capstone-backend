class AddUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :zip_code
      t.string :state
      t.string :email
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

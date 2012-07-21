class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :contact_name
      t.string :telephone
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.float :lat
      t.float :lng
      t.boolean :is_default

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :delivery_time
      t.boolean :confirmed
      t.integer :user_id
      t.decimal :ttl_price
      t.decimal :sub_ttl
      t.decimal :tax
      t.boolean :delivery
      t.integer :address_id
      t.text :delivery_instruct

      t.timestamps
    end
  end
end

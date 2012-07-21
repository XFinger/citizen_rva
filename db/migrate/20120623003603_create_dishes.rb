class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.integer :useable_id
      t.string :useable_type
      t.decimal :price, :precision => 4, :scale => 2
      t.integer :count

      t.timestamps
    end
  end
end

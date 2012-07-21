class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :d_name
      t.integer :useable_id
      t.string :useable_type
      t.decimal :d_price, :precision => 4, :scale => 2
      t.integer :d_count

      t.timestamps
    end
  end
end

class CreateBreakfasts < ActiveRecord::Migration
  def change
    create_table :breakfasts do |t|
      t.string :name
      t.string :description
      t.integer :useable_id
      t.string :useable_type
      t.decimal :price, :precision => 4, :scale => 2
      t.timestamps
    end
  end
end

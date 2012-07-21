class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.string :s_name
      t.string :s_description
      t.integer :useable_id
      t.string :useable_type
      t.decimal :s_price, :precision => 4, :scale => 2
      t.integer :s_count

      t.timestamps
    end
  end
end
